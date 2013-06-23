using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using Entities.Aplicacion;
using Entities.Negocio;
using DataLayer.ModeloEntityFramework;

namespace BusinessLayer
{
    public class AdministradorCalificaciones
    {
        private static AdministradorCalificaciones _instancia = null;

        private AdministradorCalificaciones()
        {
        }

        public static AdministradorCalificaciones Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorCalificaciones()); }
        }

        public List<ItemTablaCalificacion> CrearItemCalificacion(Viaje pViaje, Usuario pUsuarioApp)
        {
            var listaResultados = new List<ItemTablaCalificacion>();
            List<Calificacion> listaCalificaciones;

            if (pViaje.Calificaciones != null && pViaje.Calificaciones.Count > 0)
            {
                listaCalificaciones = pViaje.Calificaciones.Where(c => c.IdUsuarioEvaluador == pUsuarioApp.IdUsuario && c.FechaRealizacion == null).ToList();
                listaResultados = listaCalificaciones.Select(c => new ItemTablaCalificacion()
                    {
                        CiudadDestino = pViaje.GetCiudadDestino().Direccion,
                        CiudadOrigen = pViaje.GetCiudadOrigen().Direccion,
                        IdEvaluador = c.IdUsuarioEvaluador,
                        IdEvaluado = c.IdUsuarioEvaluado,
                        NombreParticipante = pViaje.GetPasajeros().Find(p => p.IdUsuario == c.IdUsuarioEvaluado).ObtenerNombreApellidos(),
                        Reputacion = pUsuarioApp.Reputacion != null ? pUsuarioApp.Reputacion.ToString() : "Sin reputación",
                        IdCalificacion = c.IdCalificacion
                    }).ToList();
            }
            return listaResultados;
        }

        public bool CrearCalificacion(Calificacion pCalificacion, CARPOOLEntities pContextoDb, bool pConfirmarCambios)
        {
            return CalificacionDao.Instancia.Insertar(pCalificacion, pContextoDb, pConfirmarCambios);
        }


        public decimal PromedioCalificacion(List<int> pCalificaciones)
        {
            decimal promedio = 0;
            pCalificaciones.ForEach(c => promedio = promedio + c);
            promedio = promedio / pCalificaciones.Count;
            return promedio;
        }

        public bool RegistrarCalificacion(Calificacion pCalificacion, Usuario pUsuarioEvaluado)
        {
            var contextoBd = ViajeDao.Instancia.EstablecerConexion();
            CalificacionDao.Instancia.Actualizar(pCalificacion, contextoBd, false);

            //actualiza la reputacion
            var calificacioneUsuario = ObtenerCalificacionesUsuario(pCalificacion.IdUsuarioEvaluado, true);
            calificacioneUsuario.Add(pCalificacion);

            decimal reputacionCalculada = 0;
            calificacioneUsuario.ForEach(c => reputacionCalculada = reputacionCalculada + c.Puntaje);
            reputacionCalculada = reputacionCalculada / calificacioneUsuario.Count;
            pUsuarioEvaluado.Reputacion = reputacionCalculada;

            return CalificacionDao.Instancia.ActualizarReputacion(pUsuarioEvaluado, contextoBd, true);
        }

        public List<Calificacion> ObtenerCalificacionesUsuario(string pIdUsuario, bool pSoloRealizadas)
        {
            if (pSoloRealizadas)
                return CalificacionDao.Instancia.ObtenerCalificacionesRelizadas(pIdUsuario);
            else
                return CalificacionDao.Instancia.ObtenerCalificacionesTodas(pIdUsuario);
        }
    }
}
