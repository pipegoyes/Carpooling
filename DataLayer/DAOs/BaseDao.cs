using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
//using DataLayer.ModeloEntityFramework.P;

namespace DataLayer.DAOs
{
    public abstract class BaseDao
    {
        private CARPOOLEntities _conexion;
        public CARPOOLEntities Conexion
        {
            get { return _conexion; }
        }

        public DbContext EstablecerConexion()
        {
            _conexion = new CARPOOLEntities();
            return _conexion;
        }
    }
}
