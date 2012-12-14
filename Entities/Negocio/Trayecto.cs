using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Trayecto
    {
        public long IdViaje { get; set; }
        public Coordenada CoordenadaOrigen { get; set; }
        public Coordenada CoordenadaDestino { get; set; }
        public int CuposDisponibles { get; set; }
        public int IndexOrigen { get; set; }
        public int IndexDestino { get; set; }
        public bool EsSimple { get; set; }
    }
}
