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
        public List<ListaDesplegable> ObtenerPaises()
        {
            EstablecerConexion();
            var lista = Conexion.PAIS;
            return lista.Any() ? ToBusinessEntity.Instancia.PaisToListaDesplegable(lista.ToList()) : null;
        }

        //Obtiene el listado de departamentos
        public List<ListaDesplegable> ObtenerDepartamentos(int pIdPais)
        {
            EstablecerConexion();
            var lista = Conexion.DEPARTAMENTO.Where(p => p.ID_PAIS == pIdPais);
            return lista.Any() ? ToBusinessEntity.Instancia.DepartamentoToListaDesplegable(lista.ToList()) : null;
        }

        //Obtiene el listado de departamentos
        public List<ListaDesplegable> ObtenerCiudades(int pIdDepartamento)
        {
            EstablecerConexion();
            var lista = from ciudades in Conexion.CIUDAD
                        where ciudades.ID_DEPARTAMENTO == pIdDepartamento
                        select ciudades;
            return lista.Any() ? ToBusinessEntity.Instancia.CiudadToListaDesplegable(lista.ToList()) : null;
        }

        //Obtiene el listado de ocupaciones
        public List<ListaDesplegable> ObtenerOcupaciones()
        {
            EstablecerConexion();
            var lista = Conexion.OCUPACION;
            return lista.Any() ? ToBusinessEntity.Instancia.OcupacionToListaDesplegable(lista.ToList()) : null;
        }
    }
}
