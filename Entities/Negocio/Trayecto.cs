using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Trayecto
    {
        public long IdTrayecto { get; set; }
        public Parada ParadaOrigen { get; set; }
        public Parada ParadaDestino { get; set; }
        public int CuposDisponibles { get; set; }
        public bool TrayectoSimple { get; set; }
        public List<Solicitud> ListaSolicitudes { get; set; }
        //Se debe hacer el Set a esta propiedad
        public long IdViaje { get; set; }

    }
}
