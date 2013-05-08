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

        //No abre una conexion a la base de datos, pero si guarda todos los cambios pendientes
        public bool ActualizarSolicitudIgualConexion(Solicitud pSolicitud)
        {
            var solicitudDb = ToDataEntity.Instancia.ToSolicitud(pSolicitud);
            Conexion.SOLICITUD.Attach(solicitudDb);
            return ConfirmarCambios();
            //TODO si no actualiza entonces hacer lo mismo del usuarioDAO
        }

        
    }
}
