using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessLayer.BussinessObjects;
using Entities;
using DataLayer;
namespace BusinessLayer.Servicios
{
    public class Transformador
    {
        public static void CrearViajeEntity(Viaje viajeActual)
        {
            try
            {
                VIAJE viajeDao = new VIAJE();
                
                //TODO deberia ser el creador real
                viajeDao.CREADOR = "PIPE";

                viajeDao.HORA_PARTIDA = ObtenerHoraPartida(viajeActual.HoraPartida);
                
                //TODO no podria ser una band el vehiculo
                viajeDao.CUPOS = Convert.ToByte(viajeActual.Cupos);
                
                //TODO esta fecha de creacion deberia ser con la horaPartidaStr y fecha del servidor
                viajeDao.FECHA_CREACION = DateTime.Now;
                
                
                viajeActual.FechaPartida = viajeActual.FechaPartida;

                List<Parada> listParadas = new List<Parada>();
                listParadas.Add(viajeActual.Origin);
                listParadas.AddRange(viajeActual.Waypoints);
                listParadas.Add(viajeActual.Destination);

                List<TRAYECTO> listTrayectos = new List<TRAYECTO>();
                for (int i = 0; i < listParadas.Count-1; i++)
                {
                    for (int j = i+1; j < listParadas.Count; j++)
                    {
                        
                        TRAYECTO trayectoActual = new TRAYECTO();
                        if (j-i ==1)
                            trayectoActual.ES_SIMPLE = "S";
                        else
                            trayectoActual.ES_SIMPLE = "N";
                        trayectoActual.INDEX_ORIGEN = i;
                        trayectoActual.INDEX_DESTINO = j;
                        
                        CORDENADA coordenadaOrigen = new CORDENADA();
                        coordenadaOrigen.LATITUD = listParadas[i].Latitud;
                        coordenadaOrigen.LONGITUD = listParadas[i].Longitud;
                        coordenadaOrigen.DIRECCION = listParadas[i].Direccion;
                        GeneradorInserts.InsertarCoordenada(coordenadaOrigen);

                        CORDENADA coordenadaDestino = new CORDENADA();
                        coordenadaDestino.LATITUD = listParadas[j].Latitud;
                        coordenadaDestino.LONGITUD = listParadas[j].Longitud;
                        coordenadaDestino.DIRECCION = listParadas[j].Direccion;
                        GeneradorInserts.InsertarCoordenada(coordenadaDestino);

                        trayectoActual.COORDENADA_ORIGEN = ConsultorDB.ObtenerIdCoordenada(coordenadaOrigen);
                        trayectoActual.COORDENADA_DESTINO = ConsultorDB.ObtenerIdCoordenada(coordenadaDestino);
                        trayectoActual.CUPOS_DISPONIBLES = Convert.ToByte(viajeActual.Cupos);
                        listTrayectos.Add(trayectoActual);
                    }
                }
                foreach (TRAYECTO trayectoDao in listTrayectos)
                    viajeDao.TRAYECTO.Add(trayectoDao);    
                GeneradorInserts.InsertarViaje(viajeDao);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static TimeSpan ObtenerHoraPartida(string horaPartidaStr)
        {
            try
            {
                //TODO tener cuidado de que de la hora de partida siempre cumpla el formato
                string horaFragmentada = horaPartidaStr.Split(':').ToList().First();
                int horaInt = Convert.ToInt32(horaFragmentada);
                string minutosFragmentados = horaPartidaStr.Split(':').ToList()[1].Substring(0,2);
                string diaNoche = horaPartidaStr.Substring(horaPartidaStr.Length - 2, 2);
                if (diaNoche.Equals("PM"))
                    horaInt += 12;

                TimeSpan horaPartidaTS = new TimeSpan(horaInt, Convert.ToInt32(minutosFragmentados), 00);
                return horaPartidaTS;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

    }
}
