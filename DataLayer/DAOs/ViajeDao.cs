using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework.P;
using DataLayer.Transformador;
using Entities.Negocio;

namespace DataLayer.DAOs
{
    public class ViajeDao :BaseDao
    {
        private ViajeDao()
        {
        }

        private static ViajeDao _instancia = null;

        public static ViajeDao ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new ViajeDao());
        }

        public void GuardarViaje(Viaje viaje)
        {
            try
            {
                VIAJE viajeInsertar = ToDataEntity.ToViaje(viaje);
                EstablecerConexion();
                Conexion.VIAJE.Add(viajeInsertar);
                Conexion.SaveChanges();
            }
            catch (Exception exception)
            {

                throw exception;
            }
        }
    }
}
