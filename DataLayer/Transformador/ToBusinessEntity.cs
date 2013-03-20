using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
//using DataLayer.ModeloEntityFramework.P;
using Entities.Aplicacion;
using Entities.Negocio;

namespace DataLayer.Transformador
{
    public class ToBusinessEntity
    {
        private static ToBusinessEntity _instancia = null;

        private ToBusinessEntity()
        {            
        }

        public static ToBusinessEntity Instancia
        {
            get { return _instancia ?? (_instancia = new ToBusinessEntity()); }
        }

        
        public ListaDesplegable2 PaisToListaDesplegable(PAIS pPais)
        {
            var item = new ListaDesplegable2
                           {
                               Valor = pPais.IdPais.ToString(),
                               Dato = pPais.NombrePais
                           };
            return item;
        }

        public List<ListaDesplegable2> PaisToListaDesplegable(List<PAIS> pListaPais)
        {
            var lista = pListaPais.Select(PaisToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable2 DepartamentoToListaDesplegable(DEPARTAMENTO pDepartamento)
        {
            var item = new ListaDesplegable2
            {
                Valor = pDepartamento.IdDepartamento.ToString(),
                Dato = pDepartamento.NombreDepartamento
            };
            return item;
        }

        public List<ListaDesplegable2> DepartamentoToListaDesplegable(List<DEPARTAMENTO> pListaDepartamento)
        {
            var lista = pListaDepartamento.Select(DepartamentoToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable2 CiudadToListaDesplegable(CIUDAD pCiudad)
        {
            var item = new ListaDesplegable2
            {
                Valor = pCiudad.IdCiudad.ToString(),
                Dato = pCiudad.NombreCiudad
            };
            return item;
        }

        public List<ListaDesplegable2> CiudadToListaDesplegable(List<CIUDAD> pListaCiudad)
        {
            var lista = pListaCiudad.Select(CiudadToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable2 OcupacionToListaDesplegable(OCUPACION pOcupacion)
        {
            var item = new ListaDesplegable2
            {
                Valor = pOcupacion.IdOcupacion.ToString(),
                Dato = pOcupacion.NombreOcupacion
            };
            return item;
        }

        public List<ListaDesplegable2> OcupacionToListaDesplegable(List<OCUPACION> pListaOcupacion)
        {
            var lista = pListaOcupacion.Select(OcupacionToListaDesplegable).ToList();
            return lista;
        }
    


        public static ToBusinessEntity ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new ToBusinessEntity());
        }

        public Coordenada ToCoordenada(PARADA coordenadaDb)
        {
            try
            {
                var coordenadaEntity = new Coordenada
                                           {
                                               Longitud =
                                                   (coordenadaDb.Lontitud != null) ? (decimal) coordenadaDb.Lontitud : 0,
                                               Latitud =
                                                   (coordenadaDb.Latitud != null) ? (decimal) coordenadaDb.Latitud : 0,
                                               Direccion = coordenadaDb.Direccion
                                           };
                return coordenadaEntity;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
    }
}
