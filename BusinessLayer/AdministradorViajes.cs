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
                
            //TODO Pendiente el Enum para los estados del viaje
            var viajeNuevo = new Viaje
                                 {
                                     FechaCreacion = DateTime.Now,
                                     AporteEconomico = decimal.Parse(viajeActual.Tarifa),
                                     Conductor = conductor,
                                     Estado = Viaje.ViajeEstado.Publicado,
                                     TrayectosViaje = CrearListadoTrayectos(listParadas, viajeActual.Cupos),
                                     FechaHoraPartida = DateTime.ParseExact(viajeActual.FechaPartida+" "+viajeActual.HoraPartida,"MM/dd/yyyy HH:mm:ss",null )
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
                                               NumeroParada = i
                                           };

                    var paradaDestino = new Parada
                                            {
                                                Latitud = Math.Round(Convert.ToDecimal(listParadas[j].Latitud), 6),
                                                Longitud = Math.Round(Convert.ToDecimal(listParadas[j].Longitud), 6),
                                                Direccion = listParadas[j].Direccion
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
