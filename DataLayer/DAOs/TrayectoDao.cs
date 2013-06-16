using System.Collections.Generic;
using System.Linq;
using DataLayer.ModeloEntityFramework;
using DataLayer.Transformador;
using Entities.Negocio;

namespace DataLayer.DAOs
{
    public class TrayectoDao:BaseDao
    {
        private static TrayectoDao _instancia;

        private TrayectoDao(){}

        public static TrayectoDao Instancia
        {
            get { return _instancia ?? (_instancia = new TrayectoDao()); }
        }

        //Establece la conexion y actualiza cada uno de los trayectos
        public bool ActualizarCuposSolicitud(List<Trayecto> pTrayectos, Solicitud pSolicitud)
        {
            EstablecerConexion();
            foreach (var trayectoDb in pTrayectos.Select(trayecto => ToDataEntity.Instancia.ToTrayecto(trayecto)))
            {
                Conexion.TRAYECTO.Attach(trayectoDb);
                var entidad = Conexion.Entry(trayectoDb);
                entidad.Property(t => t.CUPOS).IsModified = true;
                if (trayectoDb.SOLICITUD.Any(s => s.ID_SOLICITUD == pSolicitud.IdSolicitud))
                    SolicitudDao.Instancia.ActualizarEstadoSolicitud(trayectoDb.SOLICITUD.ToList().Find(s => s.ID_SOLICITUD == pSolicitud.IdSolicitud),Conexion);
            }

            return ConfirmarCambios();
        }

        public void BorrarTrayecto(List<TRAYECTO> listTrayectos, CARPOOLEntities pCarpoolConexion, bool guardarCambios)
        {
            foreach (var trayecto in listTrayectos)
            {
                ParadaDao.Instancia.BorrarParada(trayecto.PARADA.ToList(), pCarpoolConexion, false);
                pCarpoolConexion.TRAYECTO.Remove(trayecto);    
            }
            if (guardarCambios)
                ConfirmarCambios(pCarpoolConexion);

        }

    }
}