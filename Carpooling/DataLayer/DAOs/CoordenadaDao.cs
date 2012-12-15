using System;
using System.Linq;
using DataLayer.ModeloEntityFramework.P;

namespace DataLayer.DAOs
{
    public class CoordenadaDao
    {
        public static CORDENADA ObtenerCoordenada(decimal latitud, decimal longitud, string direccion)
        {
            try
            {
                CARPOOLINGEntities context = new CARPOOLINGEntities();
                var registrosCoordenadas = from c in context.CORDENADA
                                           where c.LATITUD == latitud
                                           where c.LONGITUD == longitud
                                           where c.DIRECCION == direccion
                                           select c;
                if(registrosCoordenadas.Any())
                    return registrosCoordenadas.First();
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
