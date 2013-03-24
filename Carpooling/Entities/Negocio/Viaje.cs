using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Viaje
    {
        public int IdViaje { get; set; }
        public string AporteEconomico { get; set; }
        public Usuario Conductor { get; set; }
        public int Estado { get; set; }
        public DateTime FechaHoraPartida { get; set; }
        public DateTime FechaCreacion { get; set; }
        public List<Trayecto> TrayectosViaje { get; set; }
        public List<Pregunta> Preguntas { get; set; }
        public List<Calificacion> Calificaciones { get; set; } 

        //public Parada Origin { get; set; }
        //public Parada Destination { get; set; }
        //public List<Parada> Waypoints { get; set; }
        
        //public int Cupos { get; set; }
        
        //public bool EsConductor { get; set; }
        //public string HoraPartida { get; set; }
        
    }
}
