using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Text;
using Entities.Negocio;
using DataLayer.Transformador;
using DataLayer.ModeloEntityFramework;

namespace DataLayer.DAOs
{
    public class CalificacionDao : BaseDao
    {
        private static CalificacionDao _instancia;

        private CalificacionDao()
        {
        }

        public static CalificacionDao Instancia
        {
            get { return _instancia ?? (_instancia = new CalificacionDao()); }
        }

        public bool Insertar(Calificacion pCalificacion, CARPOOLEntities pContextoDb, bool pConfirmarCambios)
        {            
            var calificacionDb = ToDataEntity.Instancia.ToCalificacion(pCalificacion);
            EstablecerConexion(pContextoDb);
            Conexion.CALIFICACION.Add(calificacionDb);
            if (pConfirmarCambios)
                return ConfirmarCambios();
            else
                return false;
        }

        public bool Actualizar(Calificacion pCalificacion, CARPOOLEntities pContextoDb, bool pConfirmarCambios)
        {
            var calificacionDb = ToDataEntity.Instancia.ToCalificacion(pCalificacion);
            EstablecerConexion(pContextoDb);
            Conexion.CALIFICACION.Attach(calificacionDb);
            var entidad = Conexion.Entry(calificacionDb);
            entidad.Property(x => x.PUNTAJE).IsModified = true;
            entidad.Property(x => x.FECHA_REALIZACION).IsModified = true;
            entidad.Property(x => x.COMENTARIO).IsModified = true;
            if (pConfirmarCambios)
                return ConfirmarCambios();
            else
                return false;
        }
    }
}
