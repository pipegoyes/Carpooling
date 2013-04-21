using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
using Entities.Aplicacion;
using Entities.Negocio;
using DataLayer.DAOs;

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

        
        public ListaDesplegable PaisToListaDesplegable(PAIS pPais)
        {
            var item = new ListaDesplegable
                           {
                               Valor = pPais.ID_PAIS.ToString(),
                               Dato = pPais.NOMBRE_PAIS
                           };
            return item;
        }

        public List<ListaDesplegable> PaisToListaDesplegable(List<PAIS> pListaPais)
        {
            var lista = pListaPais.Select(PaisToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable DepartamentoToListaDesplegable(DEPARTAMENTO pDepartamento)
        {
            var item = new ListaDesplegable
            {
                Valor = pDepartamento.ID_DEPARTAMENTO.ToString(),
                Dato = pDepartamento.NOMBRE_DEPARTAMENTO
            };
            return item;
        }

        public List<ListaDesplegable> DepartamentoToListaDesplegable(List<DEPARTAMENTO> pListaDepartamento)
        {
            var lista = pListaDepartamento.Select(DepartamentoToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable CiudadToListaDesplegable(CIUDAD pCiudad)
        {
            var item = new ListaDesplegable
            {
                Valor = pCiudad.ID_CIUDAD.ToString(),
                Dato = pCiudad.NOMBRE_CIUDAD
            };
            return item;
        }

        public List<ListaDesplegable> CiudadToListaDesplegable(List<CIUDAD> pListaCiudad)
        {
            var lista = pListaCiudad.Select(CiudadToListaDesplegable).ToList();
            return lista;
        }

        public ListaDesplegable OcupacionToListaDesplegable(OCUPACION pOcupacion)
        {
            var item = new ListaDesplegable
            {
                Valor = pOcupacion.ID_OCUPACION.ToString(),
                Dato = pOcupacion.NOMBRE_OCUPACION
            };
            return item;
        }

        public List<ListaDesplegable> OcupacionToListaDesplegable(List<OCUPACION> pListaOcupacion)
        {
            var lista = pListaOcupacion.Select(OcupacionToListaDesplegable).ToList();
            return lista;
        }

        public Usuario ToUsuario(USUARIO pUsuario)
        {
            Usuario usuarioBO = new Usuario
                {
                    IdUsuario = pUsuario.ID_USUARIO,
                    Contrasenia = pUsuario.CONTRASENIA,
                    Nombre = pUsuario.NOMBRE,
                    Apellido= pUsuario.APELLIDO,
                    Email=pUsuario.EMAIL,
                    FechaNacimiento = pUsuario.FECHA_NACIMIENTO,
                    FechaUltimoIngreso = pUsuario.FECHA_ULTIMO_INGRESO,
                    Genero = pUsuario.GENERO,
                    ResidenciaUbicacion = this.ToUbicacionGeografica(pUsuario.CIUDAD),
                    Ocupacion = this.ToOcupacion(pUsuario.OCUPACION),
                    TelefonoMovil = pUsuario.TELEFONO_MOVIL,
                    TelefonoFijo = pUsuario.TELEFONO_FIJO,
                    VehiculoPropio = pUsuario.VEHICULO_PROPIO,
                    Fumador = pUsuario.FUMADOR,
                    Foto = pUsuario.FOTO,
                    InformacionAdicional = pUsuario.INFORMACION_ADICIONAL,
                    Reputacion = pUsuario.REPUTACION
                };
            return usuarioBO;
        }

        public UbicacionGeografica ToUbicacionGeografica(CIUDAD pCiudad)
        {
            UbicacionGeografica ubicacionBO = new UbicacionGeografica
                {
                    IdCiudad = pCiudad.ID_CIUDAD,
                    NombreCiudad = pCiudad.NOMBRE_CIUDAD,
                    IdDepartamento = pCiudad.ID_DEPARTAMENTO,
                    NombreDepartamento = pCiudad.DEPARTAMENTO.NOMBRE_DEPARTAMENTO,
                    IdPais = pCiudad.DEPARTAMENTO.PAIS.ID_PAIS,
                    NombrePais = pCiudad.DEPARTAMENTO.PAIS.NOMBRE_PAIS                   
                };
            return ubicacionBO;
        }

        public Ocupacion ToOcupacion(OCUPACION pOcupacion)
        {
            Ocupacion ocupacionBO = new Ocupacion 
                {
                    IdOcupacion = pOcupacion.ID_OCUPACION,
                    NombreOcupacion = pOcupacion.NOMBRE_OCUPACION
                };
            return ocupacionBO;
        }
    }
}
