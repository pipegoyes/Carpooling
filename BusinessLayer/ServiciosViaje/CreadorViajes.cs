using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using DataLayer.ModeloEntityFramework.P;
using Entities.Negocio;

namespace BusinessLayer.ServiciosViaje
{
    public class CreadorViajes
    {
        public static void CrearViajeEntity(Viaje viajeActual)
        {
            try
            {
                var listParadas = new List<Parada> {viajeActual.Origin};
                listParadas.AddRange(viajeActual.Waypoints);
                listParadas.Add(viajeActual.Destination);

                viajeActual.ListTrayectos = CrearListadoTrayectos(listParadas, viajeActual.Cupos);
                
                //TODO valiadaciones antes de guardar
                ViajeDao.ObtenerInstancia().GuardarViaje(viajeActual);

                //.GuardarViaje(viajeActual);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Trayecto> CrearListadoTrayectos(List<Parada> listParadas, int cuposDisponibles)
        {
            try
            {
                List<Trayecto> listTrayectos = new List<Trayecto>();
                for (int i = 0; i < listParadas.Count - 1; i++)
                {
                    for (int j = i + 1; j < listParadas.Count; j++)
                    {

                        Trayecto trayectoActual = new Trayecto();
                        if (j - i == 1)
                            trayectoActual.EsSimple = true;
                        else
                            trayectoActual.EsSimple = false;
                        
                        trayectoActual.IndexOrigen = i;
                        trayectoActual.IndexDestino = j;

                        Coordenada coordenadaOrigen = new Coordenada();

                        coordenadaOrigen.Latitud = Math.Round(Convert.ToDecimal(listParadas[i].Latitud), 6);
                        coordenadaOrigen.Longitud = Math.Round(Convert.ToDecimal(listParadas[i].Longitud), 6);
                        coordenadaOrigen.Direccion = listParadas[i].Direccion;

                        Coordenada coordenadaDestino = new Coordenada();
                        coordenadaDestino.Latitud = Math.Round(Convert.ToDecimal(listParadas[j].Latitud), 6);
                        coordenadaDestino.Longitud = Math.Round(Convert.ToDecimal(listParadas[j].Longitud), 6);
                        coordenadaDestino.Direccion = listParadas[j].Direccion;

                        trayectoActual.CoordenadaOrigen = coordenadaOrigen;
                        trayectoActual.CoordenadaDestino = coordenadaDestino;

                        trayectoActual.CuposDisponibles = cuposDisponibles;
                        listTrayectos.Add(trayectoActual);
                    }
                }
                return listTrayectos;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
    }
}
