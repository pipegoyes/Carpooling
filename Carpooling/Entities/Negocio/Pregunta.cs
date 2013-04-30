using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Pregunta
    {
        public long IdPregunta { get; set; }
        public string TextoPregunta { get; set; }
        public string TextoRespuesta { get; set; }
        public Usuario CreadorPregunta { get; set; }
    }
}
