using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Parada
    {
        public long IdParada { get; set; }
        public decimal Latitud { get; set; }
        public decimal Longitud { get; set; }
        public string Direccion { get; set; }
        public int NumeroParada { get; set; }
        public string TipoParada { get; set; }

    }
}
