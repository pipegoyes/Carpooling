using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ItemTablaSolicitud
    {
        public string NombreSolicitante { get; set; }
        public string CiudadOrigen { get; set; }
        public string CiudadDestino { get; set; }
        public string CuposSolicitados { get; set; }
        public string CuposDisponibles { get; set; }
        public string Comentario { get; set; }
    }
}
