using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ItemTablaViaje
    {
        public long IdViaje { get; set; }
        public string NombreConductor { get; set; }
        public string ParadaOrigen { get; set; }
        public string ParadaDestino { get; set; }
        public string Cupos { get; set; }
    }
}
