using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using Entities.Negocio;
using Entities.Aplicacion;

namespace BusinessLayer
{
    public class AdministradorViajes
    {
        public static void PublicarViaje(ViajeJSON viajeActual, Usuario conductor)
        {
            var listParadas = new List<Parada> {viajeActual.Origin};
            listParadas.AddRange(viajeActual.Waypoints);
            listParadas.Add(viajeActual.Destination);
            DateTime tmp = DateTime.ParseExact(viajeActual.FechaPartida,"MM/dd/yyyy",null);
                
            //TODO Pendiente el Enum para los estados del viaje
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
            ViajeDao.ObtenerInstancia().GuardarViaje(viajeNuevo);
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

    }
}
