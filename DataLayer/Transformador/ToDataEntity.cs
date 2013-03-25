using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
using Entities.Negocio;

namespace DataLayer.Transformador
{
    public class ToDataEntity
    {
        private static ToDataEntity _instancia = null;

        private ToDataEntity()
        {            
        }

        public static ToDataEntity Instancia
        {
            get { return _instancia ?? (_instancia = new ToDataEntity()); }
        }

        //public DataLayer.ModeloEntityFramework.USUARIO ToUsuario(Usuario pUsuario)
        //{
        //    var usuario = new DataLayer.ModeloEntityFramework.USUARIO
        //                      {
        //                          IdUsuario = pUsuario.IdUsuario,
        //                          Nombre = pUsuario.Nombres,
        //                          Apellido = pUsuario.Apellidos,
        //                          Contrasenia = pUsuario.Contrasenia, //falta este campo en la bd
        //                          FechaNacimiento = pUsuario.FechaNacimiento,
        //                          Email = pUsuario.Email,
        //                          IdCiudadResidencia = pUsuario.CiudadResidencia,
        //                          Genero = pUsuario.Sexo,
        //                          IdOcupacion = pUsuario.Ocupacion,
        //                          TelefonoFijo = pUsuario.TelefonoFijo,
        //                          TelefonoMovil = pUsuario.TelefonoMovil,
        //                          Fumador = pUsuario.Fumador,
        //                          VehiculoPropio = pUsuario.VehiculoPropio,
        //                          Foto = pUsuario.Foto,
        //                          InformacionAdicional = pUsuario.MasInformacion//falta este campo en la bd
        //                      };

        //    return usuario;
        //}

        public static VIAJE ToViaje(Viaje viajeActual)
        {
            var viajeDao = new VIAJE
                               {
                                   FECHA_CREACION = DateTime.Now,
                                   APORTE_ECONOMICO = viajeActual.AporteEconomico,
                                   //TODO esta fecha de creacion deberia ser con la horaPartidaStr y fecha del servidor
                                   FECHA_HORA_PARTIDA = viajeActual.FechaHoraPartida,
                                   ID_CONDUCTOR = viajeActual.Conductor.IdUsuario,
                                   ESTADO= (int) viajeActual.Estado
                               };

            var listTrayectos = new List<TRAYECTO>();
            foreach (Trayecto trayectoActual in viajeActual.TrayectosViaje)
            {
                var trayectoDao = new TRAYECTO
                                      {
                                          TRAYECTO_SIMPLE = trayectoActual.TrayectoSimple
                                      };

                var coordenadaOrigen = new PARADA()
                                           {
                                               LATITUD = trayectoActual.ParadaOrigen.Latitud,
                                               LONGITUD = trayectoActual.ParadaOrigen.Longitud,
                                               DIRECCION= trayectoActual.ParadaOrigen.Direccion
                                           };

                var coordenadaDestino = new PARADA()
                                            {
                                                LATITUD= trayectoActual.ParadaDestino.Latitud,
                                                LONGITUD= trayectoActual.ParadaDestino.Longitud,
                                                DIRECCION = trayectoActual.ParadaDestino.Direccion
                                            };

                trayectoDao.PARADA.Add(coordenadaOrigen);
                trayectoDao.PARADA.Add(coordenadaDestino);
                trayectoDao.CUPOS = trayectoActual.CuposDisponibles;
                listTrayectos.Add(trayectoDao);
            }


            foreach (var trayectoDao in listTrayectos)
                viajeDao.TRAYECTO.Add(trayectoDao);

            return viajeDao;
        }

    }
}
