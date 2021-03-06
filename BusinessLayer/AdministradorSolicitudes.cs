﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using DataLayer.DAOs;
using Entities.Negocio;
using Entities.Aplicacion;

namespace BusinessLayer
{
    public class AdministradorSolicitudes
    {
        private static AdministradorSolicitudes _instancia = null;

        private AdministradorSolicitudes()
        {
        }

        public static AdministradorSolicitudes Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorSolicitudes()); }
        }

        public List<ItemTablaSolicitud> CreateItemSolicitud(Viaje pViaje)
        {
            var listaResult = new List<ItemTablaSolicitud>();
            foreach (var trayecto in pViaje.TrayectosViaje)
            {
                if (trayecto.ListaSolicitudes == null) continue;
                var trayecto1 = trayecto;
                //var listaTrayectosPendientes = trayecto.ListaSolicitudes.FindAll(s => s.Estado == Solicitud.SolicitudEstado.Pendiente);

                listaResult.AddRange(trayecto.ListaSolicitudes.Select((solicitud => new ItemTablaSolicitud()
                    {
                        CiudadDestino = pViaje.GetCiudadDestino().Direccion,
                        CiudadOrigen = pViaje.GetCiudadOrigen().Direccion,
                        Comentario = solicitud.Comentario,
                        CuposDisponibles = trayecto1.CuposDisponibles.ToString(),
                        CuposSolicitados = solicitud.CuposSolicitados.ToString(),
                        IdSolicitud = solicitud.IdSolicitud,
                        NombreSolicitante = solicitud.CreadorSolicitud.ObtenerNombreApellidos(),
                        //TODO la reputacion podria mostrarse con unas estrellas
                        Reputacion = (String.IsNullOrWhiteSpace(solicitud.CreadorSolicitud.Reputacion.ToString()))
                                         ? "Sin reputacion"
                                         : solicitud.CreadorSolicitud.Reputacion.ToString(),
                        Estado = solicitud.Estado
                    })));
            }
            return listaResult;
        }

        public bool AceparSolicitud(Viaje pViaje, Solicitud pSolicitud)
        {
            var trayectoSeleccionado = pViaje.TrayectosViaje.Find(t => t.IdTrayecto == pSolicitud.IdTrayecto);
            
            IEnumerable<Trayecto> trayectosModificar = (trayectoSeleccionado.TrayectoSimple)
                                                           ? DeterminarTrayectosAfectosTryS(pViaje, trayectoSeleccionado)
                                                           : DeterminarTrayectosAfectosTryC(pViaje, trayectoSeleccionado);
            trayectosModificar.ToList().ForEach(t => t.CuposDisponibles -= pSolicitud.CuposSolicitados);
            trayectoSeleccionado.CuposDisponibles -= pSolicitud.CuposSolicitados;
            var trayectosSinModificar = pViaje.TrayectosViaje.Where(
                trayecto => trayectosModificar.ToList().All(t => t.IdTrayecto != trayecto.IdTrayecto)).ToList();

            pViaje.TrayectosViaje.Clear();
            pViaje.TrayectosViaje.AddRange(trayectosSinModificar.ToList());
            pViaje.TrayectosViaje.AddRange(trayectosModificar);
            pSolicitud.Estado = Solicitud.SolicitudEstado.Aprobada;
            var result = TrayectoDao.Instancia.ActualizarCuposAprobados(pViaje.TrayectosViaje, pSolicitud);
            if(result)
                AdministradorCorreosElectronicos.Instancia.CorreoSolicitudAprobada(pSolicitud);
            return result;
        }

        public bool RechazarSolicitud(Solicitud pSolicitud)
        {
            pSolicitud.Estado = Solicitud.SolicitudEstado.Rechazada;
            if(SolicitudDao.Instancia.ActualizarEstadoSolicitud(pSolicitud))
                AdministradorCorreosElectronicos.Instancia.CorreoSolicitudRechazada(pSolicitud);
            //Todo retornoar un valor variable
            return true;
        }

        public bool CancelarParticipacion(long idViaje, Usuario participante)
        {
            var pViaje = ViajeDao.Instancia.ObtenerViaje(idViaje);
            var pSolicitud = pViaje.GetSolicitudParticipante(participante);

            var trayectoSeleccionado = pViaje.TrayectosViaje.Find(t => t.IdTrayecto == pSolicitud.IdTrayecto);

            IEnumerable<Trayecto> trayectosModificar = (trayectoSeleccionado.TrayectoSimple)
                                                           ? DeterminarTrayectosAfectosTryS(pViaje, trayectoSeleccionado)
                                                           : DeterminarTrayectosAfectosTryC(pViaje, trayectoSeleccionado);
            trayectosModificar.ToList().ForEach(t => t.CuposDisponibles += pSolicitud.CuposSolicitados);
            trayectoSeleccionado.CuposDisponibles += pSolicitud.CuposSolicitados;
            var trayectosSinModificar = pViaje.TrayectosViaje.Where(
                trayecto => trayectosModificar.ToList().All(t => t.IdTrayecto != trayecto.IdTrayecto)).ToList();

            pViaje.TrayectosViaje.Clear();
            pViaje.TrayectosViaje.AddRange(trayectosSinModificar.ToList());
            pViaje.TrayectosViaje.AddRange(trayectosModificar);
            var result = TrayectoDao.Instancia.ActualizarCuposCancelacion(pViaje.TrayectosViaje, pSolicitud);
            if (result)
                AdministradorCorreosElectronicos.Instancia.CorreoParticipacionCancelada(pViaje, pSolicitud);
            return result;
        }

        #region Internal functions

        //Busca la lista de trayectos que deben ser modificados en terminos de cupos, dado que se acepte una 
        //solicitud para un trayecto simple
        private static List<Trayecto> DeterminarTrayectosAfectosTryS(Viaje pViaje, Trayecto pTrayectoSeleccionado)
        {

            var iParadaOrigen = pTrayectoSeleccionado.ParadaOrigen.NumeroParada;
            var iParadaDestino = pTrayectoSeleccionado.ParadaDestino.NumeroParada;
            return (from trayectoViaje in pViaje.TrayectosViaje
                    let tempOrigen = trayectoViaje.ParadaOrigen.NumeroParada
                    let tempDestino = trayectoViaje.ParadaDestino.NumeroParada
                    where (iParadaOrigen > tempOrigen && iParadaOrigen < tempDestino) ||
                          (iParadaDestino > tempOrigen && iParadaDestino < tempDestino)
                    select trayectoViaje).ToList();
        }

        //Busca la lista de trayectos que deben ser modificados en terminos de cupos, dado que se acepte una 
        //solicitud para un trayecto compuesto
        private List<Trayecto> DeterminarTrayectosAfectosTryC(Viaje pViaje, Trayecto pTrayectoSeleccionado)
        {
            var trayectoAlgoritmoSimple = DeterminarTrayectosAfectosTryS(pViaje, pTrayectoSeleccionado);
            var trayectosPendientes = pViaje.TrayectosViaje.Except(trayectoAlgoritmoSimple);
            var iParadaOrigen = pTrayectoSeleccionado.ParadaOrigen.NumeroParada;
            var iParadaDestino = pTrayectoSeleccionado.ParadaDestino.NumeroParada;
            var listResult = (from trayectoViaje in trayectosPendientes
                              let tempOrigen = trayectoViaje.ParadaOrigen.NumeroParada
                              let tempDestino = trayectoViaje.ParadaDestino.NumeroParada
                              where (tempOrigen > iParadaOrigen && tempOrigen < iParadaDestino) ||
                                    (tempDestino > iParadaOrigen && tempDestino < iParadaDestino)
                              select trayectoViaje).ToList();
            listResult.AddRange(trayectoAlgoritmoSimple);
            return listResult;
        }

        //Retorna los trayectos con solicitudes
        public List<Trayecto> DeterimnarTrayectosConSolicitudesPendientes(List<Trayecto> pTrayectos)
        {
            var listTrayectos = new List<Trayecto>();
            foreach (var pTrayecto in pTrayectos.Where(pTrayecto => pTrayecto.ListaSolicitudes.Any(s => s.Estado == Solicitud.SolicitudEstado.Pendiente)))
            {
                pTrayecto.ListaSolicitudes =
                    pTrayecto.ListaSolicitudes.FindAll(e => e.Estado == Solicitud.SolicitudEstado.Pendiente);
                listTrayectos.Add(pTrayecto);
            }


            return listTrayectos;
        }

        #endregion
    }
}
