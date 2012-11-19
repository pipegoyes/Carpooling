using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayer.BussinessObjects
{
    public class Viaje
    {
        public Parada Origin { get; set; }
        public Parada Destination { get; set; }
        public List<Parada> Waypoints { get; set; }
        public string Tarifa { get; set; }
        public int Cupos { get; set; }
        public string FechaPartida { get; set; }
        public bool EsConductor { get; set; }
        public string HoraPartida { get; set; }
    }
}
