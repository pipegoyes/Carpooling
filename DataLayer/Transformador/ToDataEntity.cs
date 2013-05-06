﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

        public USUARIO ToUsuario(Usuario pUsuario)
        {
            var usuario = new USUARIO
                              {                                  
                                  ID_USUARIO = pUsuario.IdUsuario,
                                  NOMBRE = pUsuario.Nombre,
                                  APELLIDO = pUsuario.Apellido,
                                  CONTRASENIA = pUsuario.Contrasenia, 
                                  FECHA_NACIMIENTO = pUsuario.FechaNacimiento,
                                  FECHA_ULTIMO_INGRESO = pUsuario.FechaUltimoIngreso,
                                  EMAIL = pUsuario.Email,
                                  ID_CIUDAD_RESIDENCIA = pUsuario.ResidenciaUbicacion.IdCiudad,
                                  GENERO = pUsuario.Genero,
                                  ID_OCUPACION = pUsuario.Ocupacion.IdOcupacion,
                                  TELEFONO_FIJO = pUsuario.TelefonoFijo,
                                  TELEFONO_MOVIL = pUsuario.TelefonoMovil,
                                  FUMADOR = pUsuario.Fumador,
                                  VEHICULO_PROPIO = pUsuario.VehiculoPropio,
                                  FOTO = pUsuario.Foto,
                                  INFORMACION_ADICIONAL = pUsuario.InformacionAdicional,
                                  REPUTACION = pUsuario.Reputacion
                              };

            return usuario;
        }


        public VIAJE ToViaje(Viaje viajeActual)
        {
            var viajeDao = new VIAJE
                               {
                                   FECHA_CREACION = DateTime.Now,
                                   APORTE_ECONOMICO = viajeActual.AporteEconomico,
                                   //TODO esta fecha de creacion deberia ser con la horaPartidaStr y fecha del servidor
                                   FECHA_HORA_PARTIDA = viajeActual.FechaHoraPartida,
                                   ID_CONDUCTOR = viajeActual.Conductor.IdUsuario,
                                   ESTADO = (int) viajeActual.Estado,
                                   TRAYECTO = new Collection<TRAYECTO>()
                               };

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
                                               DIRECCION= trayectoActual.ParadaOrigen.Direccion,
                                               TIPO_PARADA = trayectoActual.ParadaOrigen.TipoParada,
                                               NUMERO_PARADA = trayectoActual.ParadaOrigen.NumeroParada
                                           };

                var coordenadaDestino = new PARADA()
                                            {
                                                LATITUD= trayectoActual.ParadaDestino.Latitud,
                                                LONGITUD= trayectoActual.ParadaDestino.Longitud,
                                                DIRECCION = trayectoActual.ParadaDestino.Direccion,
                                                TIPO_PARADA = trayectoActual.ParadaDestino.TipoParada,
                                                NUMERO_PARADA = trayectoActual.ParadaDestino.NumeroParada
                                            };

                trayectoDao.PARADA.Add(coordenadaOrigen);
                trayectoDao.PARADA.Add(coordenadaDestino);
                trayectoDao.CUPOS = trayectoActual.CuposDisponibles;
                viajeDao.TRAYECTO.Add(trayectoDao);
            }


            return viajeDao;
        }

    }
}
