using System.Linq;
using DataLayer.ModeloEntityFramework;

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

        public bool DescontarCupos(int numerdoCuposSolicitados, long idTrayecto)
        {
            EstablecerConexion();
            var regTrayectos = from t in Conexion.TRAYECTO
                           where t.ID_TRAYECTO == idTrayecto
                           select t;
            if (regTrayectos.Any())
            {
                var trayecto = regTrayectos.First();
                if (trayecto.CUPOS >= numerdoCuposSolicitados)
                {
                    trayecto.CUPOS -= numerdoCuposSolicitados;
                    return true;
                }
            }
            return false;
        }
    }
}