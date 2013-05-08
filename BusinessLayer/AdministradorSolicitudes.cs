using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using Entities.Negocio;
using Entities.Aplicacion;

namespace BusinessLayer
{
    public class AdministradorSolicitudes
    {
        private static AdministradorSolicitudes _instancia = null;

        private AdministradorSolicitudes()
        {
        }

        public static AdministradorSolicitudes Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorSolicitudes()); }
        }

        public List<ItemTablaSolicitud> CreateItemSolicitud(Viaje pViaje)
        {
            var listaResult = new List<ItemTablaSolicitud>();
            foreach (var trayecto in pViaje.TrayectosViaje)
            {
                if (trayecto.ListaSolicitudes != null)
                {
                    listaResult.AddRange(trayecto.ListaSolicitudes.Select(solicitud => new ItemTablaSolicitud()
                        {
                            CiudadDestino = pViaje.GetCiudadDestino().Direccion,
                            CiudadOrigen = pViaje.GetCiudadOrigen().Direccion,
                            Comentario = solicitud.Comentario,
                            CuposDisponibles = trayecto.CuposDisponibles.ToString(),
                            CuposSolicitados = solicitud.CuposSolicitados.ToString(),
                            IdSolicitud = solicitud.IdSolicitud,
                            NombreSolicitante = solicitud.CreadorSolicitud.ObtenerNombreApellidos()
                        }));
                }
            }
            return listaResult;
        }

        public bool AceparSolicitud(Viaje pViaje, Solicitud pSolicitud)
        {
            var trayectoSeleccionado = pViaje.TrayectosViaje.Find(t => t.IdTrayecto == pSolicitud.IdTrayecto);
            //var trayectosModificar;

            IEnumerable<Trayecto> trayectosModificar = (trayectoSeleccionado.TrayectoSimple)? 
                DeterminarTrayectosAfectosTryS(pViaje, trayectoSeleccionado):
                DeterminarTrayectosAfectosTryC(pViaje,trayectoSeleccionado);
            trayectosModificar.ToList().ForEach(t => t.CuposDisponibles -= pSolicitud.CuposSolicitados);
            //IEnumerable<Trayecto> trayectosSinModificar = pViaje.TrayectosViaje.Except(trayectosModificar.ToList());
            var trayectosSinModificar = pViaje.TrayectosViaje.Where(trayecto => trayectosModificar.ToList().All(t => t.IdTrayecto != trayecto.IdTrayecto)).ToList();

            pViaje.TrayectosViaje.Clear();
            pViaje.TrayectosViaje.AddRange(trayectosSinModificar.ToList());
            pViaje.TrayectosViaje.AddRange(trayectosModificar);
            TrayectoDao.Instancia.ActualizarCupos(pViaje.TrayectosViaje);
            pSolicitud.Estado = Solicitud.SolicitudEstado.Aprobada;
            //TODO Esta funcionalidad esta pendiente por cambios
            return SolicitudDao.Instancia.ActualizarSolicitudIgualConexion(pSolicitud);
            
        }

        //Busca la lista de trayectos que deben ser modificados en terminos de cupos, dado que se acepte una 
        //solicitud para un trayecto simple
        private static List<Trayecto> DeterminarTrayectosAfectosTryS(Viaje pViaje, Trayecto pTrayectoSeleccionado)
        {
            
            var iParadaOrigen = pTrayectoSeleccionado.ParadaOrigen.NumeroParada;
            var iParadaDestino = pTrayectoSeleccionado.ParadaDestino.NumeroParada;
            return (from trayectoViaje in pViaje.TrayectosViaje
                    let tempOrigen = trayectoViaje.ParadaOrigen.NumeroParada
                    let tempDestino = trayectoViaje.ParadaDestino.NumeroParada
                    where (iParadaOrigen > tempOrigen && iParadaOrigen < tempDestino) ||
                          (iParadaDestino > tempOrigen && iParadaDestino < tempDestino)
                    select trayectoViaje).ToList();
        }

        //Busca la lista de trayectos que deben ser modificados en terminos de cupos, dado que se acepte una 
        //solicitud para un trayecto compuesto
        private List<Trayecto> DeterminarTrayectosAfectosTryC(Viaje pViaje, Trayecto pTrayectoSeleccionado)
        {
            var trayectoAlgoritmoSimple = DeterminarTrayectosAfectosTryS(pViaje, pTrayectoSeleccionado);
            var trayectosPendientes = pViaje.TrayectosViaje.Except(trayectoAlgoritmoSimple);
            var iParadaOrigen = pTrayectoSeleccionado.ParadaOrigen.NumeroParada;
            var iParadaDestino = pTrayectoSeleccionado.ParadaDestino.NumeroParada;
            var listResult = (from trayectoViaje in trayectosPendientes
                                         let tempOrigen = trayectoViaje.ParadaOrigen.NumeroParada
                                         let tempDestino = trayectoViaje.ParadaDestino.NumeroParada
                                         where (tempOrigen > iParadaOrigen && tempOrigen < iParadaDestino) ||
                                               (tempDestino > iParadaOrigen && tempDestino < iParadaDestino)
                                         select trayectoViaje).ToList();
            listResult.AddRange(trayectoAlgoritmoSimple);
            return listResult;
        }

        //private IEnumerable<Trayecto> DescontarCupos(IEnumerable<Trayecto> pTrayectos, int numeroCuposSolicitados)
        //{
        //    var pTrayectosList = pTrayectos as IList<Trayecto> ?? pTrayectos.ToList();
        //    if (pTrayectosList.Any())
        //    {
        //        foreach (var pTrayecto in pTrayectosList.
        //          Where(pTrayecto => pTrayecto.CuposDisponibles >= numeroCuposSolicitados))
        //            pTrayecto.CuposDisponibles -= numeroCuposSolicitados;
        //        return pTrayectosList;
        //    }
        //    return null;
        //}
    }
}
