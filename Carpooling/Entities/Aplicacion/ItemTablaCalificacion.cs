using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ItemTablaCalificacion
    {
        public long IdCalificacion { get; set; }
        public string IdEvaluador { get; set; }
        public string IdEvaluado { get; set; }
        public string NombreParticipante { get; set; }
        public string CiudadOrigen { get; set; }
        public string CiudadDestino { get; set; }
        public string Reputacion { get; set; }
    }
}
