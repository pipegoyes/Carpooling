using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;
using Entities.Aplicacion;
namespace BusinessLayer
{
    public class AdministradorSolicitudes
    {
        private static AdministradorSolicitudes _instancia = null;
        
        private AdministradorSolicitudes(){}

        public static AdministradorSolicitudes Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorSolicitudes()); }
        }

        public List<ItemTablaSolicitud> CreateItemSolicitud(Viaje pViaje)
        {
            var listaResult = new List<ItemTablaSolicitud>();
            foreach (var trayecto in pViaje.TrayectosViaje)
            {
                if (trayecto.ListaSolicitudes != null)
                {
                    listaResult.AddRange(trayecto.ListaSolicitudes.Select(solicitud => new ItemTablaSolicitud()
                        {
                            CiudadDestino = pViaje.GetCiudadDestino().Direccion,
                            CiudadOrigen = pViaje.GetCiudadOrigen().Direccion,
                            Comentario = solicitud.Comentario,
                            CuposDisponibles = trayecto.CuposDisponibles.ToString(),
                            CuposSolicitados = solicitud.CuposSolicitados.ToString(),
                            NombreSolicitante = solicitud.CreadorSolicitud.ObtenerNombreApellidos()
                        }));
                }
            }
            return listaResult;
        } 

        public bool AceparSolicitud(Viaje pViaje, Solicitud pSolicitud)
        {
            return false;
        }

        //Busca la lista de trayectos que deben ser modificados en terminos de cupos, dado que se acepte una 
        //solicitud para un trayecto simple
        private List<Trayecto> DeterminarTrayectosAfectosTS(Viaje pViaje, Solicitud pSolicitud)
        {
            //TODO Aqui quedo el desarrollo 07/05 GOyes
            return null;
        }
    }
}
