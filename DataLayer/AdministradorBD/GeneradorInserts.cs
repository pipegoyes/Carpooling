using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework.P;

namespace DataLayer.AdministradorBD
{
    public class GeneradorInserts
    {
        public static void InsertarCoordenada(CORDENADA coordenadaInsertar)
        {
            try
            {
                decimal latitud = Math.Round(Convert.ToDecimal(coordenadaInsertar.LATITUD), 6);
                decimal longitud = Math.Round(Convert.ToDecimal(coordenadaInsertar.LONGITUD), 6);

                CARPOOLINGEntities context = new CARPOOLINGEntities();
                var registrosCoordenadas = from c in context.CORDENADA
                                           where c.LATITUD == latitud 
                                           where c.LONGITUD == longitud
                                           where c.DIRECCION == coordenadaInsertar.DIRECCION
                                           select c;
                if (!registrosCoordenadas.Any())
                {
                    coordenadaInsertar.LATITUD = latitud;
                    coordenadaInsertar.LONGITUD = longitud;
                    context.CORDENADA.Add(coordenadaInsertar);
                    context.SaveChanges();
                }
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public static void InsertarViaje(VIAJE viajeNuevo)
        {
            try
            {
                CARPOOLINGEntities context = new CARPOOLINGEntities();
                context.VIAJE.Add(viajeNuevo);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
