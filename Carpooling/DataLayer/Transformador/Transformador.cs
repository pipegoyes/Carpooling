using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using DataLayer.ModeloEntityFramework.P;
using Entities.Negocio;

namespace DataLayer.Transformador
{
    public class Transformador
    {
        public static VIAJE TransformarViaje(Viaje viajeActual)
        {
            try
            {
                ///comment
                VIAJE viajeDao = new VIAJE();

                viajeDao.CREADOR = "PIPE";

                viajeDao.HORA_PARTIDA = TransformarHora(viajeActual.HoraPartida);

                //TODO no podria ser una band el vehiculo y ademas los cupos son del trayecto y no del viaje
                viajeDao.CUPOS = Convert.ToByte(viajeActual.Cupos);

                //TODO esta fecha de creacion deberia ser con la horaPartidaStr y fecha del servidor
                viajeDao.FECHA_CREACION = DateTime.Now;


                viajeActual.FechaPartida = viajeActual.FechaPartida;

                List<Parada> listParadas = new List<Parada>();
                listParadas.Add(viajeActual.Origin);
                listParadas.AddRange(viajeActual.Waypoints);
                listParadas.Add(viajeActual.Destination);

                List<TRAYECTO> listTrayectos = new List<TRAYECTO>();
                foreach (Trayecto trayectoActual in viajeActual.ListTrayectos)
                {
                    TRAYECTO trayectoDao = new TRAYECTO();
                    trayectoDao.ES_SIMPLE = (trayectoActual.EsSimple)?"S":"N";
                    trayectoDao.INDEX_ORIGEN = trayectoActual.IndexOrigen;
                    trayectoDao.INDEX_DESTINO = trayectoActual.IndexDestino;

                    CORDENADA coordenadaOrigen = CoordenadaDao.ObtenerCoordenada(
                        trayectoActual.CoordenadaOrigen.Latitud, trayectoActual.CoordenadaOrigen.Longitud,
                        trayectoActual.CoordenadaOrigen.Direccion);

                    if(coordenadaOrigen ==null)
                    {
                        coordenadaOrigen = new CORDENADA();
                        coordenadaOrigen.LATITUD = trayectoActual.CoordenadaOrigen.Latitud;
                        coordenadaOrigen.LONGITUD = trayectoActual.CoordenadaOrigen.Longitud;
                        coordenadaOrigen.DIRECCION = trayectoActual.CoordenadaOrigen.Direccion;
                    }

                    CORDENADA coordenadaDestino =
                        CoordenadaDao.ObtenerCoordenada(trayectoActual.CoordenadaDestino.Latitud,
                                                        trayectoActual.CoordenadaDestino.Longitud,
                                                        trayectoActual.CoordenadaDestino.Direccion);
                    if(coordenadaDestino== null)
                    {
                        coordenadaDestino = new CORDENADA();
                        coordenadaDestino.LATITUD = trayectoActual.CoordenadaDestino.Latitud;
                        coordenadaDestino.LONGITUD = trayectoActual.CoordenadaDestino.Longitud;
                        coordenadaDestino.DIRECCION = trayectoActual.CoordenadaDestino.Direccion;
                    }
                    
                    trayectoDao.CORDENADA = coordenadaOrigen;
                    trayectoDao.CORDENADA1 = coordenadaDestino;
                    
                    trayectoDao.CUPOS_DISPONIBLES = Convert.ToByte(viajeActual.Cupos);
                    listTrayectos.Add(trayectoDao);
                }


                foreach (TRAYECTO trayectoDao in listTrayectos)
                    viajeDao.TRAYECTO.Add(trayectoDao);

                return viajeDao;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        private static TimeSpan TransformarHora(string horaPartidaStr)
        {
            try
            {
                //TODO tener cuidado de que de la hora de partida siempre cumpla el formato
                string horaFragmentada = horaPartidaStr.Split(':').ToList().First();
                int horaInt = Convert.ToInt32(horaFragmentada);
                string minutosFragmentados = horaPartidaStr.Split(':').ToList()[1].Substring(0, 2);
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
