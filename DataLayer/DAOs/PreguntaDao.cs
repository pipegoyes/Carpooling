using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;
using DataLayer.Transformador;

namespace DataLayer.DAOs
{
    public class PreguntaDao : BaseDao
    {
        private static PreguntaDao _instancia;

        private PreguntaDao()
        {
        }

        public static PreguntaDao Instancia
        {
            get { return _instancia ?? (_instancia = new PreguntaDao()); }
        }

        public bool ActualizarPregunta(Pregunta pPregunta)
        {
            EstablecerConexion();
            var preguntaDb = ToDataEntity.Instancia.ToPregunta(pPregunta);
            Conexion.PREGUNTA.Attach(preguntaDb);
            var entidad = Conexion.Entry(preguntaDb);
            entidad.Property(p => p.TEXTO_RESPUESTA).IsModified = true;
            return ConfirmarCambios();
        }
    }
}
