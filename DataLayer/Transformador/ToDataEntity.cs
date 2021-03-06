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
                                  REPUTACION = pUsuario.Reputacion,
                                  ESTADO = (int)pUsuario.Estado
                              };

            return usuario;
        }

        public VIAJE ToViaje(Viaje viajeActual)
        {
            var viajeDao = new VIAJE
                               {
                                   //TODO esta fecha de creacion deberia ser con la horaPartidaStr y fecha del servidor
                                   FECHA_CREACION = DateTime.Now,
                                   APORTE_ECONOMICO = viajeActual.AporteEconomico,
                                   FECHA_HORA_PARTIDA = viajeActual.FechaHoraPartida,
                                   ID_CONDUCTOR = viajeActual.Conductor.IdUsuario,
                                   ESTADO = (int) viajeActual.Estado,
                                   ID_VIAJE = viajeActual.IdViaje,
                                   PREGUNTA = (viajeActual.Preguntas ==null)?null:viajeActual.Preguntas.Select(ToPregunta).ToList(),
                                   //USUARIO = (viajeActual.Conductor !=null)?ToUsuario(viajeActual.Conductor):null,
                                   //TRAYECTO = viajeActual.TrayectosViaje.Select(ToTrayecto).ToList(),
                                   CALIFICACION = (viajeActual.Calificaciones==null)?null:viajeActual.Calificaciones.Select(ToCalificacion).ToList(),
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

        public SOLICITUD ToSolicitud(Solicitud pSolicitud)
        {
            return new SOLICITUD()
                       {
                           ID_TRAYECTO = pSolicitud.IdTrayecto,
                           COMENTARIO = pSolicitud.Comentario,
                           CUPOS_SOLICITADOS = pSolicitud.CuposSolicitados,
                           ESTADO = (int) pSolicitud.Estado,
                           ID_PASAJERO = pSolicitud.CreadorSolicitud.IdUsuario,
                           ID_SOLICITUD = pSolicitud.IdSolicitud,
                           TRAYECTO = (pSolicitud.Trayecto != null)? ToTrayecto(pSolicitud.Trayecto):null
                       };
        }

        public TRAYECTO ToTrayecto(Trayecto pTrayecto)
        {
            var listParadas = new List<Parada> {pTrayecto.ParadaOrigen, pTrayecto.ParadaDestino};
            return new TRAYECTO()
                {
                    CUPOS = pTrayecto.CuposDisponibles,
                    ID_TRAYECTO = pTrayecto.IdTrayecto,
                    ID_VIAJE = pTrayecto.IdViaje,
                    SOLICITUD = (pTrayecto.ListaSolicitudes != null)?pTrayecto.ListaSolicitudes.Select(ToSolicitud).ToList(): null,
                    PARADA = ToParadas(listParadas)
                };
        }

        public List<PARADA> ToParadas(List<Parada> pParadas)
        {
            return pParadas.Select(p => new PARADA()
                {
                    ID_PARADA = p.IdParada,
                    DIRECCION = p.Direccion,
                    LATITUD = p.Latitud,
                    LONGITUD = p.Longitud,
                    NUMERO_PARADA = p.NumeroParada,
                    TIPO_PARADA = p.TipoParada,
                    ID_TRAYECTO = p.IdTrayecto
                }).ToList();
        }

        public PREGUNTA ToPregunta(Pregunta pPregunta)
        {
            return new PREGUNTA()
                       {
                           ID_CREADOR_PREGUNTA = pPregunta.CreadorPregunta.IdUsuario,
                           ID_VIAJE = pPregunta.IdViaje,
                           TEXTO_PREGUNTA = pPregunta.TextoPregunta,
                           TEXTO_RESPUESTA = pPregunta.TextoRespuesta,
                           ID_PREGUNTA = pPregunta.IdPregunta
                       };
        }

        public CALIFICACION ToCalificacion(Calificacion pCalificacion)
        {
            return new CALIFICACION()
                       {
                           ID_CALIFICACION = pCalificacion.IdCalificacion,
                           FECHA_REALIZACION = pCalificacion.FechaRealizacion,
                           PUNTAJE = pCalificacion.Puntaje,
                           COMENTARIO = pCalificacion.Comentario,
                           ID_VIAJE = pCalificacion.IdViaje,
                           ID_EVALUADO = pCalificacion.IdUsuarioEvaluado,
                           ID_EVALUADOR = pCalificacion.IdUsuarioEvaluador
                       };
        }
    }
}
