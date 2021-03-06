﻿using System;
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

        public List<ItemTablaViaje> ListaViajesToItemsTabla(List<VIAJE> pListaViajes)
        {
            
            
            return (from viajeDB in pListaViajes
                    let nombrePParadaOrigen = viajeDB.TRAYECTO.ToList().Find(z => z.PARADA.First().NUMERO_PARADA == 1).PARADA.First().DIRECCION
                    let numeroTrayectos = viajeDB.TRAYECTO.Count
                    let numeroParadas = Convert.ToInt32((Math.Sqrt((8*numeroTrayectos + 1)) + 1)/2)
                    let nombrePParadaDestino = viajeDB.TRAYECTO.ToList().Find(z => z.PARADA.Last().NUMERO_PARADA == numeroParadas).PARADA.Last().DIRECCION
                    let fechaHoraViaje = viajeDB.FECHA_HORA_PARTIDA.ToString("MM/dd/yyyy HH:mm")
                    select new ItemTablaViaje()
                               {
                                   NombreConductor = (System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(viajeDB.USUARIO.NOMBRE.Trim().ToLower()) + " " + System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(viajeDB.USUARIO.APELLIDO.Trim().ToLower())).Trim(), 
                                   ParadaDestino = nombrePParadaDestino, 
                                   ParadaOrigen = nombrePParadaOrigen,
                                   FechaHora = fechaHoraViaje,
                                   IdViaje = viajeDB.ID_VIAJE,
                                   IdUsuario = viajeDB.USUARIO.ID_USUARIO
                               }).ToList();
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
                    Reputacion = pUsuario.REPUTACION,
                    Estado = (UsuarioEstado)pUsuario.ESTADO
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

        public Viaje ToViaje(VIAJE pViaje)
        {
            return  new Viaje()
                              {
                                  AporteEconomico = pViaje.APORTE_ECONOMICO,
                                  Calificaciones = ToCalificaciones(pViaje.CALIFICACION.ToList()),
                                  Conductor = ToUsuario(pViaje.USUARIO),
                                  Estado = Viaje.GetViajeEstado(pViaje.ESTADO), 
                                  FechaCreacion = pViaje.FECHA_CREACION,
                                  FechaHoraPartida = pViaje.FECHA_HORA_PARTIDA,
                                  IdViaje = pViaje.ID_VIAJE,
                                  Preguntas = ToPreguntas(pViaje.PREGUNTA.ToList()),
                                  TrayectosViaje = ToTrayectos(pViaje.TRAYECTO.ToList()),
                              };

        }

        public Calificacion ToCalificacion(CALIFICACION pCalificacion)
        {
            return new Calificacion 
                {
                    IdCalificacion = pCalificacion.ID_CALIFICACION,
                    Puntaje = pCalificacion.PUNTAJE,
                    FechaRealizacion = pCalificacion.FECHA_REALIZACION,
                    Comentario = pCalificacion.COMENTARIO,
                    IdUsuarioEvaluador = pCalificacion.USUARIO_EVALUADOR.ID_USUARIO,
                    IdUsuarioEvaluado = pCalificacion.USUARIO_EVALUADO.ID_USUARIO,
                    IdViaje = pCalificacion.VIAJE.ID_VIAJE
                };
        }

        public List<Calificacion> ToCalificaciones(List<CALIFICACION> pCalificacions)
        {
            return pCalificacions.Select(ToCalificacion).ToList();
        } 

        public List<Pregunta> ToPreguntas (List<PREGUNTA> pPreguntas )
        {
            return pPreguntas.Select(p => new Pregunta()
                                              {
                                                  CreadorPregunta = ToUsuario(p.USUARIO),
                                                  TextoPregunta = p.TEXTO_PREGUNTA,
                                                  IdPregunta = p.ID_PREGUNTA,
                                                  TextoRespuesta = p.TEXTO_RESPUESTA,
                                                  IdViaje = p.ID_VIAJE
                                              }).ToList();
        }

        public List<Trayecto> ToTrayectos(List<TRAYECTO> pTrayectos)
        {
            return pTrayectos.Select(trayecto => new Trayecto
                                                     {
                                                         CuposDisponibles = trayecto.CUPOS, 
                                                         TrayectoSimple = trayecto.TRAYECTO_SIMPLE, 
                                                         IdTrayecto = trayecto.ID_TRAYECTO,
                                                         IdViaje = trayecto.ID_VIAJE,
                                                         ListaSolicitudes = ToSolicitudes(trayecto.SOLICITUD.ToList()), 
                                                         ParadaOrigen = ToParada(trayecto.PARADA.ToList().Find(t => t.TIPO_PARADA == "I")), 
                                                         ParadaDestino = ToParada(trayecto.PARADA.ToList().Find(t => t.TIPO_PARADA == "F"))
                                                     }).ToList();
        }

        public Trayecto ToTrayecto(TRAYECTO pTrayecto)
        {
            return new Trayecto
                       {
                           CuposDisponibles = pTrayecto.CUPOS,
                           TrayectoSimple = pTrayecto.TRAYECTO_SIMPLE,
                           IdTrayecto = pTrayecto.ID_TRAYECTO,
                           IdViaje = pTrayecto.ID_VIAJE,
                           ListaSolicitudes = ToSolicitudes(pTrayecto.SOLICITUD.ToList()),
                           ParadaOrigen = ToParada(pTrayecto.PARADA.ToList().Find(t => t.TIPO_PARADA == "I")),
                           ParadaDestino = ToParada(pTrayecto.PARADA.ToList().Find(t => t.TIPO_PARADA == "F"))
                       };
        }

        public Parada ToParada(PARADA pParada)
        {
            return new Parada()
                       {
                            Direccion = pParada.DIRECCION,
                            Latitud = pParada.LATITUD,
                            IdParada = pParada.ID_PARADA,
                            Longitud = pParada.LONGITUD,
                            NumeroParada = pParada.NUMERO_PARADA,
                            TipoParada = pParada.TIPO_PARADA,
                            IdTrayecto = pParada.ID_TRAYECTO
                       };
        }

        public List<Solicitud> ToSolicitudes (List<SOLICITUD> pSolicitud)
        {
            return pSolicitud.Select(s => new Solicitud()
                                              {
                                                  Comentario = s.COMENTARIO,
                                                  CreadorSolicitud = ToUsuario(s.USUARIO),
                                                  CuposSolicitados = s.CUPOS_SOLICITADOS,
                                                  Estado = Solicitud.GetSolicitudEstado(s.ESTADO),
                                                  IdTrayecto = s.ID_TRAYECTO,
                                                  IdSolicitud = s.ID_SOLICITUD
                                              }).ToList();
        } 

        public List<Viaje> ToViajes(List<VIAJE> pViajes)
        {
            return pViajes.Select(ToViaje).ToList();
        }
    }
}
