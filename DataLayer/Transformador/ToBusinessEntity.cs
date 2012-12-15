using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;
using DataLayer.ModeloEntityFramework.P;
namespace DataLayer.Transformador
{
    public class ToBusinessEntity
    {
        private ToBusinessEntity()
        {
        }

        private static ToBusinessEntity _instancia = null;

        public static ToBusinessEntity ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new ToBusinessEntity());
        }

        public Coordenada ToCoordenada(CORDENADA coordenadaDb)
        {
            try
            {
                var coordenadaEntity = new Coordenada
                                           {
                                               Longitud =
                                                   (coordenadaDb.LONGITUD != null) ? (decimal) coordenadaDb.LONGITUD : 0,
                                               Latitud =
                                                   (coordenadaDb.LATITUD != null) ? (decimal) coordenadaDb.LATITUD : 0,
                                               Direccion = coordenadaDb.DIRECCION
                                           };
                return coordenadaEntity;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
    }
}
