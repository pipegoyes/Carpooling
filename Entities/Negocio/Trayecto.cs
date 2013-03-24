using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Trayecto
    {
        public int IdTrayecto { get; set; }
        public Parada ParadaOrigen { get; set; }
        public Parada ParadaDestino { get; set; }
        public int CuposDisponibles { get; set; }
        
        //public long IdViaje { get; set; }
        //public int IndexOrigen { get; set; }
        //public int IndexDestino { get; set; }
        //public bool EsSimple { get; set; }
    }
}
