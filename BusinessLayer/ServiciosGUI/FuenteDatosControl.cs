using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Entities.Aplicacion;
using DataLayer.DAOs;

namespace BusinessLayer.ServiciosGUI
{
    public class FuenteDatosControl
    {
        private static FuenteDatosControl _instancia = null;
                
        //Contructor
        private FuenteDatosControl()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static FuenteDatosControl Instancia
        {
            get { return _instancia ?? (_instancia = new FuenteDatosControl()); } 
        }

        //Obtiene el listado de paises
        public List<ListaDesplegable2> ObtenerPaises()
        {
            return ListaDesplegableDao.Instancia.ObtenerPaises();
        }

        //Obtiene el listado de departamentos de un pais determinado
        public List<ListaDesplegable2> ObtenerDepartamentos(int pIdPais)
        {
            return ListaDesplegableDao.Instancia.ObtenerDepartamentos(pIdPais);
        }

        //Obtiene el listado de ciudades de un departamento determinado
        public List<ListaDesplegable2> ObtenerCiudades(int pIdDepartamento)
        {
            return ListaDesplegableDao.Instancia.ObtenerCiudades(pIdDepartamento);
        }
    }
}
