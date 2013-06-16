using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;

namespace DataLayer.DAOs
{
    public class ParadaDao : BaseDao
    {
        private static ParadaDao _instancia;

        private ParadaDao() { }

        public static ParadaDao Instancia
        {
            get { return _instancia ?? (_instancia = new ParadaDao()); }
        }

        public void BorrarParada(List<PARADA> listParada, CARPOOLEntities carpoolConexion, bool guardarCambios)
        {
            foreach (var parada in listParada)
                carpoolConexion.PARADA.Remove(parada);    
            
            if (guardarCambios)
                ConfirmarCambios(carpoolConexion);
        }
    }
}
