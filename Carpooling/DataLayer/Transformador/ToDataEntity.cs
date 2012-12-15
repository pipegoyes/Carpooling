using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework.M;
using Entities.Negocio;

namespace DataLayer.Transformador
{
    public class ToDataEntity
    {
        private static ToDataEntity _instancia = null;

        private ToDataEntity()
        {            
        }

        public static ToDataEntity ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new ToDataEntity());
        }

        public USUARIO ToUsuario(Usuario pUsuario)
        {
            var usuario = new USUARIO
                              {
                                  ID_USUARIO = pUsuario.IdUsuario,
                                  NOMBRES = pUsuario.Nombres,
                                  APELLIDOS = pUsuario.Apellidos,
                                  CONTRASENIA = pUsuario.Contrasenia,
                                  FECHA_NACIMIENTO = pUsuario.FechaNacimiento,
                                  EMAIL = pUsuario.Email,
                                  CIUDAD_RESIDENCIA = pUsuario.CiudadResidencia,
                                  SEXO = pUsuario.Sexo,
                                  OCUPACION = pUsuario.Ocupacion,
                                  TELEFONO_FIJO = pUsuario.TelefonoFijo,
                                  TELEFONO_MOVIL = pUsuario.TelefonoMovil,
                                  FUMADOR = pUsuario.Fumador,
                                  VEHICULO_PROPIO = pUsuario.VehiculoPropio,
                                  FOTO = pUsuario.Foto,
                                  MAS_INFO = pUsuario.MasInformacion            
                              };
            return usuario;
        }
    }
}
