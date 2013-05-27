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
            if(PreguntaDao.Instancia.ActualizarPregunta(pPregunta))
            {
                AdministradorCorreosElectronicos.Instancia.CorreoRespuestaPregunta(pPregunta);
                return true;
            }
                throw new Exception("No se ha podido actualizar la respuesta de la pregunta, por favor realice la acción de nuevo.");
            
        }

        public bool RealizarPregunta(Pregunta ppregunta)
        {
            var viajePregunta = ViajeDao.Instancia.ObtenerViaje(ppregunta.IdViaje);
            if (PreguntaDao.Instancia.CrearPregunta(ppregunta))
            {
                AdministradorCorreosElectronicos.Instancia.CorreoPregunta(ppregunta, viajePregunta.Conductor);
                return true;
            }
            throw new Exception("No se ha podido generar la pregunta sobre el viaje, por favor re-intente enviar su solicitud.");
        }
    }
}
