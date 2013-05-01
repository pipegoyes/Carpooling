using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Viaje
    {
        [Flags]
        public enum ViajeEstado : int
        {
            Publicado = 1,
            Cancelado = 2,
            Realizado = 3
        }

        public long IdViaje { get; set; }
        public decimal AporteEconomico { get; set; }
        public Usuario Conductor { get; set; }
        public ViajeEstado Estado { get; set; }
        public DateTime FechaHoraPartida { get; set; }
        public DateTime FechaCreacion { get; set; }
        public List<Trayecto> TrayectosViaje { get; set; }
        public List<Pregunta> Preguntas { get; set; }
        public List<Calificacion> Calificaciones { get; set; }  
    
        public static ViajeEstado GetViajeEstado(int estadoInt)
        {
            switch (estadoInt)
            {
                case 1:
                    return ViajeEstado.Publicado;

                case 2:
                    return ViajeEstado.Cancelado;

                case 3:
                    return ViajeEstado.Realizado;
                default:
                    throw new Exception("No se encontro el estado del viaje numero: "+estadoInt);
            }
        }

        public List<Parada> GetParadas()
        {
            var listaParadas = new List<Parada>();
            foreach (Trayecto trayecto in TrayectosViaje)
            {
                if(listaParadas.All(p => p != trayecto.ParadaDestino))
                    listaParadas.Add(trayecto.ParadaDestino);
                if (listaParadas.All(p => p != trayecto.ParadaOrigen))
                    listaParadas.Add(trayecto.ParadaOrigen);
            }
            return listaParadas;
        } 

        public List<Parada> GetParadasSinOrigenDestino()
        {
            var listParadas = GetParadas();
            listParadas.Remove(GetCiudadDestino());
            listParadas.Remove(GetCiudadOrigen());
            return listParadas;
        } 

        public Parada GetCiudadOrigen()
        {
            foreach (Trayecto trayecto in TrayectosViaje.Where(trayecto => trayecto.ParadaOrigen.NumeroParada == 1))
            {
                return trayecto.ParadaOrigen;
            }
            throw new Exception("No existe una parada inicial para este viaje.");
        }

        public Parada GetCiudadDestino()
        {
            int numeroParadas = GetNumeroParadas();
            foreach (Trayecto trayecto in TrayectosViaje.Where(trayecto => trayecto.ParadaDestino.NumeroParada == numeroParadas))
            {
                return trayecto.ParadaDestino;
            }
            throw new Exception("No existe una parada inicial para este viaje.");
        }

        public int GetNumeroParadas()
        {
            return Convert.ToInt32((Math.Sqrt((8*TrayectosViaje.Count + 1)) + 1)/2);
        }
    }
}
