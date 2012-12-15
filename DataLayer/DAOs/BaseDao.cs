using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework.M;
using DataLayer.ModeloEntityFramework.P;

namespace DataLayer.DAOs
{
    public abstract class BaseDao
    {
        private CARPOOLINGEntities _conexion;
        public CARPOOLINGEntities Conexion
        {
            get { return _conexion; }
        }

        public DbContext EstablecerConexion()
        {
            _conexion = new CARPOOLINGEntities();
            return _conexion;
        }
    }
}
