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
        public void ActualizarCupos(List<Trayecto> pTrayectos)
        {
            EstablecerConexion();
            foreach (var trayectoDb in pTrayectos.Select(trayecto => ToDataEntity.Instancia.ToTrayecto(trayecto)))
            {
                Conexion.TRAYECTO.Attach(trayectoDb);
                //TODO si no actualiza ningun campo agregar sentencias de modificacion del usuarioDAO
            }
        }

        //private bool DescontarCupos(int numerdoCuposSolicitados, long idTrayecto)
        //{
        //    //EstablecerConexion();
        //    var regTrayectos = from t in Conexion.TRAYECTO
        //                   where t.ID_TRAYECTO == idTrayecto
        //                   select t;
        //    if (regTrayectos.Any())
        //    {
        //        var trayecto = regTrayectos.First();
        //        if (trayecto.CUPOS >= numerdoCuposSolicitados)
        //        {
        //            trayecto.CUPOS -= numerdoCuposSolicitados;
        //            return true;
        //        }
        //    }
        //    return false;
        //}
    }
}