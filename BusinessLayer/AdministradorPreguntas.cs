using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer.DAOs;
using Entities.Aplicacion;
using Entities.Negocio;

namespace BusinessLayer
{
    public class AdministradorPreguntas
    {
         private static AdministradorPreguntas _instancia = null;

         private AdministradorPreguntas()
        {
        }

         public static AdministradorPreguntas Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorPreguntas()); }
        }

        public List<ItemTablaPregunta> CreateItemPregunta(Viaje pViaje)
         {
             return pViaje.Preguntas.Select(p => new ItemTablaPregunta()
             {
                 IdPregunta = p.IdPregunta,
                 NombreCreador = p.CreadorPregunta.ObtenerNombreApellidos(),
                 TextoPregunta = p.TextoPregunta,
                 TextoRespuesta = (String.IsNullOrWhiteSpace(p.TextoRespuesta))?"Sin respuesta":p.TextoRespuesta
             }).ToList();
         } 

        public bool GuardarRespuesta(Pregunta pPregunta)
        {
            return PreguntaDao.Instancia.ActualizarPregunta(pPregunta);
        }

        public bool RealizarPregunta(Pregunta ppregunta)
        {
            return PreguntaDao.Instancia.CrearPregunta(ppregunta);
        }
    }
}
