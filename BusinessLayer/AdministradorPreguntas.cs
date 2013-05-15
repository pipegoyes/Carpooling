using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
                 NombreCreador = p.CreadorPregunta.ObtenerNombreApellidos(),
                 TextoPregunta = p.TextoPregunta,
                 TextoRespuesta = p.TextoRespuesta
             }).ToList();
         } 
    }
}
