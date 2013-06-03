using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;

namespace DataLayer.DAOs
{
    public abstract class BaseDao
    {
        private CARPOOLEntities _conexion;
        public CARPOOLEntities Conexion
        {
            get { return _conexion; }
        }

        public CARPOOLEntities EstablecerConexion()
        {
            _conexion = new CARPOOLEntities();
            return _conexion;
        }

        protected CARPOOLEntities EstablecerConexion(CARPOOLEntities pContextoDb)
        {
            if (pContextoDb == null)
                _conexion = new CARPOOLEntities();
            else
                _conexion = pContextoDb;
            return _conexion;
        }

        protected void TerminarConexion()
        {
            if (this._conexion != null)
                this._conexion.Dispose();
        }

        public void TerminarConexion(CARPOOLEntities pContextoDb)
        {
            if (pContextoDb != null)
                pContextoDb.Dispose();
        }

        public bool ConfirmarCambios()
        {
            if (this.Conexion.SaveChanges() > 0)
                return true;
            return false;
        }

        protected long ConfirmarCambiosMultiple()
        {
            return (long)this.Conexion.SaveChanges();
        }

        public long ConfirmarCambios(CARPOOLEntities pContextoDb)
        {
            return (long)pContextoDb.SaveChanges();
        }
    }
}
