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

        public DbContext EstablecerConexion()
        {
            _conexion = new CARPOOLEntities();
            return _conexion;
        }

        public void TerminarConexion()
        {
            if (this._conexion != null)
                this._conexion.Dispose();
        }

        public bool ConfirmarCambios()
        {
            if (this.Conexion.SaveChanges() > 0)
                return true;
            return false;
        }
    }
}
