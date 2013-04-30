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
    }
}
