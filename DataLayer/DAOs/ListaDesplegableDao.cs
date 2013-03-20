using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Aplicacion;
using DataLayer.Transformador;


namespace DataLayer.DAOs
{
    public class ListaDesplegableDao : BaseDao
    {
        private static ListaDesplegableDao _instancia = null;
                
        //Contructor
        private ListaDesplegableDao()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static ListaDesplegableDao Instancia
        {
            get { return _instancia ?? (_instancia = new ListaDesplegableDao()); }
        }

        //Obtiene el listado de paises
        public List<ListaDesplegable2> ObtenerPaises()
        {
            EstablecerConexion();
            var lista = from paises in Conexion.PAIS select paises;
            return lista.Any() ? ToBusinessEntity.Instancia.PaisToListaDesplegable(lista.ToList()) : null;
        }

        //Obtiene el listado de departamentos
        public List<ListaDesplegable2> ObtenerDepartamentos(int pIdPais)
        {
            EstablecerConexion();
            var lista = from departamentos in Conexion.DEPARTAMENTO 
                        where departamentos.IdPais == pIdPais 
                        select departamentos;
            return lista.Any() ? ToBusinessEntity.Instancia.DepartamentoToListaDesplegable(lista.ToList()) : null;
        }

        //Obtiene el listado de departamentos
        public List<ListaDesplegable2> ObtenerCiudades(int pIdDepartamento)
        {
            EstablecerConexion();
            var lista = from ciudades in Conexion.CIUDAD
                        where ciudades.IdDepartamento == pIdDepartamento
                        select ciudades;
            return lista.Any() ? ToBusinessEntity.Instancia.CiudadToListaDesplegable(lista.ToList()) : null;
        }

    }
}
