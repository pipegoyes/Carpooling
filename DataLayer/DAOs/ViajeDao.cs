using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.ModeloEntityFramework.P;
using Entities.Negocio;

namespace DataLayer.DAOs
{
    public class ViajeDao
    {
        public static void GuardarViaje(Viaje viaje)
        {
            try
            {
                VIAJE viajeInsertar = Transformador.Transformador.TransformarViaje(viaje);
                CARPOOLINGEntities context = new CARPOOLINGEntities();
                context.VIAJE.Add(viajeInsertar);
                context.SaveChanges();
            }
            catch (Exception exception)
            {

                throw exception;
            }
        }
    }
}
