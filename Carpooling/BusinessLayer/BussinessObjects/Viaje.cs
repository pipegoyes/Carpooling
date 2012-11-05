using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayer.BussinessObjects
{
    public class Viaje
    {
        public string Origin { get; set; }
        public string Destination { get; set; }
        public List<Parada> Waypoints { get; set; }
        public string Tarifa { get; set; }
        public int Cupos { get; set; }
        public string FechaPartida { get; set; }
        public string Rol { get; set; }
    }
}
