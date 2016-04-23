using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;

namespace Entities.Aplicacion
{
    public class ItemTablaSolicitud
    {
        public long IdSolicitud { get; set; }
        public string NombreSolicitante { get; set; }
        public string CiudadOrigen { get; set; }
        public string CiudadDestino { get; set; }
        public string CuposSolicitados { get; set; }
        public string CuposDisponibles { get; set; }
        public string Comentario { get; set; }
        public string Reputacion { get; set; }
        public Solicitud.SolicitudEstado Estado { get; set; }
    }
}
