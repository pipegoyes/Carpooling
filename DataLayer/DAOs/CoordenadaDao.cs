using System;
using System.Linq;
using DataLayer.Transformador;
using Entities.Negocio;
using DataLayer.ModeloEntityFramework;
namespace DataLayer.DAOs
{
    public class CoordenadaDao : BaseDao
    {
        private CoordenadaDao(){}

        private static CoordenadaDao _instancia = null;

        public static CoordenadaDao ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new CoordenadaDao());
        }

        public Coordenada ObtenerCoordenada(decimal latitud, decimal longitud, string direccion)
        {
            try
            {
                EstablecerConexion();
                var registrosCoordenadas = from c in this.Conexion.PARADA
                                           where c.Latitud == latitud
                                           where c.Lontitud == longitud
                                           where c.Direccion == direccion
                                           select c;

                if (registrosCoordenadas.Any())
                    return ToBusinessEntity.ObtenerInstancia().ToCoordenada(registrosCoordenadas.First());
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
