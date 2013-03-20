using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Aplicacion
{
    public class ListaDesplegable2
    {
        public string Valor { get; set; }
        public string Dato { get; set; }

        public ListaDesplegable2()
        {
        }

        public ListaDesplegable2(string pValor, string pDato)
        {
            Valor = pValor;
            Dato = pDato;
        }
    } 
}
