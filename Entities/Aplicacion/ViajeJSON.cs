using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;

namespace Entities.Aplicacion
{
// ReSharper disable InconsistentNaming
    public class ViajeJSON
// ReSharper restore InconsistentNaming
    {
        public Parada Origin { get; set; }
        public Parada Destination { get; set; }
        public List<Parada> Waypoints { get; set; }
        public int Cupos { get; set; }
        public int Tarifa { get; set; }
        public string FechaPartida { get; set; }
        public string HoraPartida { get; set; }

    }
}
