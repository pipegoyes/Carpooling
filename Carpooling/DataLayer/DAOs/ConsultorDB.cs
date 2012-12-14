using System;
using System.Linq;
using DataLayer.ModeloEntityFramework.P;

namespace DataLayer.DAOs
{
    public class ConsultorDB
    {
        public static CORDENADA ObtenerIdCoordenada(decimal latitud, decimal longitud, string direccion)
        {
            try
            {
                //decimal latitud = Math.Round(Convert.ToDecimal(coordenadaBuscar.LATITUD), 6);
                //decimal longitud = Math.Round(Convert.ToDecimal(coordenadaBuscar.LONGITUD), 6);

                CARPOOLINGEntities context = new CARPOOLINGEntities();
                var registrosCoordenadas = from c in context.CORDENADA
                                           where c.LATITUD == latitud
                                           where c.LONGITUD == longitud
                                           where c.DIRECCION == direccion
                                           select c;
                if(registrosCoordenadas.Any())
                    return registrosCoordenadas.First();
                return null;
                //throw new Exception("Coordenada NO encontrada en la base de datos: Latitud: "+latitud
                //    + " Longitud: "+latitud +
                //    " Direccion: "+direccion);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
