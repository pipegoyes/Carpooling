using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
using Entities.Negocio;
using DataLayer.Transformador;
namespace DataLayer.DAOs
{
    public class SolicitudDao : BaseDao
    {
        private static SolicitudDao _instancia;

        private SolicitudDao()
        {
        }

        public static SolicitudDao Instancia
        {
            get { return _instancia ?? (_instancia = new SolicitudDao()); }
        }

        public void InsertarSolicitud(Solicitud pSolicitud)
        {
            EstablecerConexion();
            var solicitudDb = ToDataEntity.Instancia.ToSolicitud(pSolicitud);
            Conexion.SOLICITUD.Add(solicitudDb);
            Conexion.SaveChanges();
        }

        public bool ExisteSolicitud(Usuario pasajero, long idTrayecto)
        {
            EstablecerConexion();
            var registrosSolicitudes = from s in Conexion.SOLICITUD
                                       where s.ID_TRAYECTO == idTrayecto && s.ID_PASAJERO == pasajero.IdUsuario
                                       select s;
            return registrosSolicitudes.Any();
        }

        //No abre una pConexion a la base de datos, se encarga de actualizar el estado de las solicitudes
        public void ActualizarEstadoSolicitud(SOLICITUD pSolicitud, CARPOOLEntities pConexion)
        {
            pConexion.SOLICITUD.Attach(pSolicitud);
            var entidad = pConexion.Entry(pSolicitud);
            entidad.Property(s => s.ESTADO).IsModified = true;
        }

        //Actualiza la solicitud utilizando el BO correspondiente
        public bool ActualizarEstadoSolicitud(Solicitud pSolicitud)
        {
            EstablecerConexion();
            var solicitudDb = ToDataEntity.Instancia.ToSolicitud(pSolicitud);
            Conexion.SOLICITUD.Attach(solicitudDb);
            var entidad = Conexion.Entry(solicitudDb);
            entidad.Property(s => s.ESTADO).IsModified = true;
            return ConfirmarCambios();
        }

        public List<Solicitud> ConsultarSolicitudesAprobadas(Usuario pasajero)
        {
            EstablecerConexion();
            var regSolicitudes = from n in Conexion.SOLICITUD
                                 where
                                     n.ID_PASAJERO == pasajero.IdUsuario &&
                                     n.ESTADO == (int) Solicitud.SolicitudEstado.Aprobada
                                 select n;
            return regSolicitudes.Any() ? ToBusinessEntity.Instancia.ToSolicitudes(regSolicitudes.ToList()) : null;
        } 

        public void EliminarSolicitud(SOLICITUD pSolicitud, CARPOOLEntities pConexion)
        {
            pConexion.SOLICITUD.Remove(pSolicitud);
        }
    }
}
