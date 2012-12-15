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
        private CARPOOLINGEntitiesM _conexion;
        public CARPOOLINGEntitiesM Conexion
        {
            get { return _conexion; }
        }

        //public DbContext EstablecerConexion(string pModel)
        //{            
        //    switch (pModel)
        //    {
        //        case "M": _conexion = new CARPOOLINGEntitiesM(); break;
        //        case "P": _conexion = new CARPOOLINGEntities(); break;
        //        default: _conexion = new CARPOOLINGEntities(); break;
        //    }
        //    return _conexion;
        //}

        public DbContext EstablecerConexion()
        {
            _conexion = new CARPOOLINGEntitiesM();
            return _conexion;
        }
    }
}
