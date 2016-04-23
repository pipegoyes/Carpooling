using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ItemTablaPregunta
    {
        public long IdPregunta { get; set; }
        public string NombreCreador { get; set; }
        public string TextoPregunta { get; set; }
        public string TextoRespuesta { get; set; }

    }
}
