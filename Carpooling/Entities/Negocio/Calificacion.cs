using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Calificacion
    {
        public long IdCalificacion { get; set; }
        public DateTime? FechaRealizacion { get; set; }
        public decimal Puntaje { get; set; }
        public Usuario Evaluador { get; set; }
    }
}
