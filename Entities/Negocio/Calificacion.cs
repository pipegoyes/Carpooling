using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Calificacion
    {
        public long IdCalificacion { get; set; }
        public decimal Puntaje { get; set; }
        public DateTime? FechaRealizacion { get; set; }
        public string Comentario { get; set; }
        public long IdViaje { get; set; }
        public string IdUsuarioEvaluador { get; set; }
        public string IdUsuarioEvaluado { get; set; }
    }
}
