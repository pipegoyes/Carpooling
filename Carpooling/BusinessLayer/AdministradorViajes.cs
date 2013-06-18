using System;
using System.Collections.Generic;
using System.Configuration;
using System.ComponentModel;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using Entities.Negocio;
using Entities.Aplicacion;

namespace BusinessLayer
{
    public class AdministradorViajes
    {
        private static AdministradorViajes _instancia = null;

        //Contructor
        private AdministradorViajes()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministradorViajes Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorViajes()); } 
        }

        public List<ItemTablaViaje> BuscarViaje(string ciudadOrigen, string ciudadDestino, DateTime? fechaRealizacion)
        {
            return ViajeDao.Instancia.ConsultarListaViaje(ciudadOrigen, ciudadDestino, fechaRealizacion);
        }

        public long PublicarViaje(ViajeJSON viajeActual, Usuario conductor)
        {
            var listParadas = new List<Parada> {viajeActual.Origin};
            listParadas.AddRange(viajeActual.Waypoints);
            listParadas.Add(viajeActual.Destination);
            DateTime tmp = DateTime.ParseExact(viajeActual.FechaPartida,"MM/dd/yyyy",null);
                
            var viajeNuevo = new Viaje
                                 {
                                     FechaCreacion = DateTime.Now,
                                     AporteEconomico = viajeActual.Tarifa,
                                     Conductor = conductor,
                                     Estado = Viaje.ViajeEstado.Publicado,
                                     TrayectosViaje = CrearListadoTrayectos(listParadas, viajeActual.Cupos),
                                     FechaHoraPartida = Convert.ToDateTime(tmp.ToShortDateString() + " " + viajeActual.HoraPartida)
                                 };

            //TODO valiadaciones antes de guardar
            return ViajeDao.Instancia.GuardarViaje(viajeNuevo);
        }

        public long GuardarCambios(ViajeJSON viajeActual, Usuario conductor, string idViajeEditable)
        {
            var listParadas = new List<Parada> { viajeActual.Origin };
            listParadas.AddRange(viajeActual.Waypoints);
            listParadas.Add(viajeActual.Destination);
            DateTime tmp = DateTime.ParseExact(viajeActual.FechaPartida, "MM/dd/yyyy", null);

            var viajeNuevo = new Viaje
            {
                IdViaje = Convert.ToInt32(idViajeEditable),
                FechaCreacion = DateTime.Now,
                AporteEconomico = viajeActual.Tarifa,
                Conductor = conductor,
                Estado = Viaje.ViajeEstado.Publicado,
                TrayectosViaje = CrearListadoTrayectos(listParadas, viajeActual.Cupos),
                FechaHoraPartida = Convert.ToDateTime(tmp.ToShortDateString() + " " + viajeActual.HoraPartida)
            };
            var context = ViajeDao.Instancia.EstablecerConexion();
            var result = ViajeDao.Instancia.ActualizarParametrosViaje(viajeNuevo, context);
            if(result!=0)
                return result;
            return 0;
        }

        public static List<Trayecto> CrearListadoTrayectos(List<Parada> listParadas, int cuposDisponibles)
        {
            var listTrayectos = new List<Trayecto>();

            for (var i = 0; i < listParadas.Count - 1; i++)
            {
                    
                for (var j = i + 1; j < listParadas.Count; j++)
                {

                    var trayectoActual = new Trayecto {TrayectoSimple = j - i == 1};

                    var paradaOrigen = new Parada
                                           {
                                               Latitud = Math.Round(Convert.ToDecimal(listParadas[i].Latitud), 6),
                                               Longitud = Math.Round(Convert.ToDecimal(listParadas[i].Longitud), 6),
                                               Direccion = listParadas[i].Direccion,
                                               NumeroParada = i+1,
                                               TipoParada = "I"
                                           };

                    var paradaDestino = new Parada
                                            {
                                                Latitud = Math.Round(Convert.ToDecimal(listParadas[j].Latitud), 6),
                                                Longitud = Math.Round(Convert.ToDecimal(listParadas[j].Longitud), 6),
                                                Direccion = listParadas[j].Direccion, 
                                                NumeroParada = j+1,
                                                TipoParada = "F"

                                            };

                    trayectoActual.ParadaOrigen = paradaOrigen;
                    trayectoActual.ParadaDestino = paradaDestino;

                    trayectoActual.CuposDisponibles = cuposDisponibles;
                    listTrayectos.Add(trayectoActual);
                }
            }
            return listTrayectos;
        }

        public Viaje VerDetalleViaje(long idViajeDetalle)
        {
            return ViajeDao.Instancia.ObtenerViaje(idViajeDetalle);
        }

        public bool RegistrarSolicitud(Solicitud pSolicitud)
        {
            if (!SolicitudDao.Instancia.ExisteSolicitud(pSolicitud.CreadorSolicitud, pSolicitud.IdTrayecto))
            {
                SolicitudDao.Instancia.InsertarSolicitud(pSolicitud);
                return true;
            }
            return false;
        }

        public List<Viaje> BuscarMisViajesConductor(Usuario pUsuario)
        {
            return ViajeDao.Instancia.ConsultarMisViajes(pUsuario);
        }

        public List<ItemTablaViaje> ToListItemTabla(List<Viaje> pviajesList)
        {
            return pviajesList.Select(v => new ItemTablaViaje()
            {
                FechaHora = v.FechaHoraPartida.ToString("MM/dd/yyyy HH:mm"),
                ParadaDestino = v.GetCiudadDestino().Direccion,
                ParadaOrigen = v.GetCiudadOrigen().Direccion,
                IdViaje = v.IdViaje
            }).ToList();
        }

        public bool CancelarViaje(Viaje pViaje)
        {
            pViaje.Estado = Viaje.ViajeEstado.Cancelado;
            if(ViajeDao.Instancia.EliminarViaje(pViaje))
            {
                AdministradorCorreosElectronicos.Instancia.CorreoCancelacionViaje(pViaje);
                return true;
            }
            throw new Exception("El correo electronico a los pasajeros del viaje no ha sido enviado exitosamente, por favor re-intente realizar la acción");
        }

        /// <summary>
        /// Procedimiento que se ejecuta periodicamente para actualizar el estado de los viajes que de acuerdo a su fecha de realización
        /// ya dejaron de ser vigentes
        /// </summary>
        /// <returns></returns>
        public static void MonitorViajesVigentes(object sender, DoWorkEventArgs e)
        {
            //Actualiza el estado de los viajes en la BD
            IEnumerable<Viaje> viajesActualizar= new List<Viaje>();
            var contextoBd = ViajeDao.Instancia.EstablecerConexion(); //obtiene un contexto de bd para la trasaccion global

            //Acutializa el estado de los viajes que ya no son vigentes
            long viajesActualizadoBD = ViajeDao.Instancia.ActualizarEstadoViajesRealizados(DateTime.Today, out viajesActualizar, contextoBd, false);

            //Crear los registros de calificaciones pendientes
            if (viajesActualizar.Count() == (int)viajesActualizadoBD)
            {
                foreach (var viaje in viajesActualizar)
                {
                    foreach (var pasajero in viaje.GetPasajeros())
	                {
                        Calificacion calificacionInsertar;
                        //registro calificacion conductor pasajero
                        calificacionInsertar = new Calificacion() 
                            {
                                Puntaje = 0,
                                IdViaje = viaje.IdViaje,
                                IdUsuarioEvaluador = viaje.Conductor.IdUsuario,
                                IdUsuarioEvaluado = pasajero.IdUsuario
                            };
                        CalificacionDao.Instancia.Insertar(calificacionInsertar, contextoBd, false);

                        //registro calificacion pasajero conductor
                        calificacionInsertar = new Calificacion()
                        {
                            Puntaje = 0,
                            IdViaje = viaje.IdViaje,
                            IdUsuarioEvaluador = pasajero.IdUsuario,
                            IdUsuarioEvaluado = viaje.Conductor.IdUsuario
                        };
                        CalificacionDao.Instancia.Insertar(calificacionInsertar, contextoBd, false);

                        //envia el email de calificacion pendiente al pasajero 
                        AdministradorCorreosElectronicos.Instancia.CorreoCalificacionParticipante(viaje, pasajero);
	                }

                    //envia el email de calificacion pendiente al conductor
                    AdministradorCorreosElectronicos.Instancia.CorreoCalificacionConductor(viaje);
                }
                
                //confirma los cambios en la bd y destruye el contexto
                ViajeDao.Instancia.ConfirmarCambios(contextoBd);
            }
            ViajeDao.Instancia.TerminarConexion(contextoBd);
        }


        public static void MonitorViajesVigentesCompleto(object sender, RunWorkerCompletedEventArgs e)
        {
            BackgroundWorker worker = sender as BackgroundWorker;
            if (worker != null)
            {
                int intervaloEjecucion = Convert.ToInt32(ConfigurationManager.AppSettings["IntervaloSegundosEjecucionMonitoreoViajesVigentes"]);
                System.Threading.Thread.Sleep(intervaloEjecucion);
                worker.RunWorkerAsync();
            }
        }

        public List<Viaje> BuscarViajesVigentesPasajero(Usuario pUsuario)
        {
            var listSolicitudes = SolicitudDao.Instancia.ConsultarSolicitudesAprobadas(pUsuario);
            return listSolicitudes != null ? ViajeDao.Instancia.ConsultarViajesFromSolicitudes(listSolicitudes) : null;
        } 
    }
}
