using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class UbicacionGeografica
    {
        public int IdCiudad { get; set; }
        public string NombreCiudad { get; set; }
        public int? IdDepartamento { get; set; }
        public string NombreDepartamento { get; set; }
        public int IdPais { get; set; }
        public string NombrePais { get; set; }
    }
}
