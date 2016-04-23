using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    public class Solicitud
    {
        public long IdSolicitud { get; set; }
        public long IdTrayecto { get; set; }
        public string Comentario { get; set; }
        public int CuposSolicitados { get; set; }
        public SolicitudEstado Estado { get; set; }
        public Usuario CreadorSolicitud { get; set; }
        public Trayecto Trayecto { get; set; }

        public enum SolicitudEstado
        {
            Pendiente = 1,
            Aprobada = 2,
            Rechazada = 3
        }

        public static SolicitudEstado GetSolicitudEstado(int estadoInt)
        {
            switch (estadoInt)
            {
                case 1:
                    return SolicitudEstado.Pendiente;

                case 2:
                    return SolicitudEstado.Aprobada;

                case 3:
                    return SolicitudEstado.Rechazada;
                default:
                    throw new Exception("NO se encontro el estado de la solicitud numero: "+estadoInt);
            }
        }
    }
}
