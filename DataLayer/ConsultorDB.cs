using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
namespace DataLayer
{
    public class ConsultorDB
    {
        public static long ObtenerIdCoordenada(CORDENADA coordenadaBuscar)
        {
            try
            {
                decimal latitud = Math.Round(Convert.ToDecimal(coordenadaBuscar.LATITUD), 6);
                decimal longitud = Math.Round(Convert.ToDecimal(coordenadaBuscar.LONGITUD), 6);

                CARPOOLINGEntities context = new CARPOOLINGEntities();
                var registrosCoordenadas = from c in context.CORDENADA
                                           where c.LATITUD == latitud
                                           where c.LONGITUD == longitud
                                           where c.DIRECCION == coordenadaBuscar.DIRECCION
                                           select c;
                if(registrosCoordenadas.Any())
                    return registrosCoordenadas.First().ID_CORDENADA;
                throw new Exception("Coordenada NO encontrada en la base de datos: Latitud: "+coordenadaBuscar.LATITUD
                    + " Longitud: "+coordenadaBuscar.LONGITUD +
                    " Direccion: "+coordenadaBuscar.DIRECCION);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
