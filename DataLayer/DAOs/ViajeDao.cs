using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using DataLayer.ModeloEntityFramework;
using DataLayer.Transformador;
using Entities.Negocio;
using Entities.Aplicacion;


namespace DataLayer.DAOs
{
    public class ViajeDao : BaseDao
    {
        private static ViajeDao _instancia;

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

        public List<ItemTablaViaje> ConsultarListaViaje(string ciudadOrigen, string ciudadDestino, DateTime? fechaRealizacion)
        {
            EstablecerConexion();
            
            var s = from v in Conexion.VIAJE
                    from p in Conexion.PARADA
                    from t in Conexion.TRAYECTO
                    where p.DIRECCION == ciudadOrigen && p.TIPO_PARADA == "I"
                    where p.ID_TRAYECTO == t.ID_TRAYECTO && v.ID_VIAJE == t.ID_VIAJE
                    select v;

            s = from v in s
                from t in v.TRAYECTO
                from p in t.PARADA
                where p.DIRECCION == ciudadDestino && p.TIPO_PARADA == "F"
                where p.ID_TRAYECTO == t.ID_TRAYECTO && v.ID_VIAJE == t.ID_VIAJE
                select v;


            if (fechaRealizacion != null)
            {
                var fechaTemp = (DateTime) fechaRealizacion;
                s = from v in s
                    where v.FECHA_HORA_PARTIDA.Day == fechaTemp.Day
                    select v;
            }

            var listaTemp = s.Distinct().ToList();
            return ToBusinessEntity.Instancia.ListaViajesToItemsTabla(listaTemp);
        }

        public Viaje ObtenerViaje(long idViaje)
        {
            EstablecerConexion();
            var viajeEncontrado = from v in Conexion.VIAJE
                                  where v.ID_VIAJE == idViaje
                                  select v;
            if(viajeEncontrado.Any())
                return ToBusinessEntity.Instancia.ToViaje(viajeEncontrado.First());
            throw new Exception("El viaje con el id: " + idViaje + " no se encuentra en la base de datos");
        }
    }
}