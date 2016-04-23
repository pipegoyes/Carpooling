using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ListaDesplegable
    {
        public string Valor { get; set; }
        public string Dato { get; set; }

        public ListaDesplegable()
        {
        }

        public ListaDesplegable(string pValor, string pDato)
        {
            Valor = pValor;
            Dato = pDato;
        }
    } 
}
