using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework;
using DataLayer.Transformador;
using Entities.Negocio;

namespace DataLayer.DAOs
{
    public class ViajeDao :BaseDao
    {
        private static ViajeDao _instancia = null;

        private ViajeDao()
        {
        }

        public static ViajeDao Instancia
        {
            get { return _instancia ?? (_instancia = new ViajeDao()); }
        }

        public long GuardarViaje(Viaje viaje)
        {
            VIAJE viajeInsertar = ToDataEntity.Instancia.ToViaje(viaje);
            EstablecerConexion();
            Conexion.VIAJE.Add(viajeInsertar);
            Conexion.SaveChanges();
            return viajeInsertar.ID_VIAJE;
        }


    }
}
