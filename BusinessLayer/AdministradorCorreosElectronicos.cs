using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using Entities.Negocio;

namespace BusinessLayer
{
    public class AdministradorCorreosElectronicos
    {
        private static AdministradorCorreosElectronicos _instancia = null;
        private MailMessage Mensaje { get; set; }
        private SmtpClient SMTPServicio { get; set; }
        
        public string CuentaEmailAdministrador 
        {
            get
            {
                return ConfigurationManager.AppSettings["CuentaEmailAdministrador"];
            }
        }

        public string ContraseniaEmailAdministrador
        {
            get
            {
                return ConfigurationManager.AppSettings["ContraseniaEmailAdministrador"];
            }
        }
        
        
        //Contructor
        private AdministradorCorreosElectronicos()
        {

        }

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministradorCorreosElectronicos Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorCorreosElectronicos()); } 
        }

        //Envia un correo sin formato
        private void EnviarCorreoPlano(string pCorreoRemitente, List<string> pCorreosDestinatario, List<string> pCorreosCopia, List<string> pCorreosCopiaOculpa, string pAsunto, string pMensaje, bool pEsHtml)
        {
            Mensaje = new MailMessage();
            Mensaje.From = new MailAddress(CuentaEmailAdministrador);
            Mensaje.IsBodyHtml = pEsHtml;

            if (pCorreosDestinatario == null)
                pCorreosDestinatario = new List<string>();
            if (pCorreosCopia == null)
                pCorreosCopia = new List<string>();
            if (pCorreosCopiaOculpa == null)
                pCorreosCopiaOculpa = new List<string>();
            
            pCorreosDestinatario.ForEach(destinatario => Mensaje.To.Add(new MailAddress(destinatario)));
            pCorreosCopia.ForEach(copia => Mensaje.CC.Add(new MailAddress(copia)));
            pCorreosCopiaOculpa.ForEach(copiaOculta => Mensaje.Bcc.Add(new MailAddress(copiaOculta)));
            Mensaje.Subject = pAsunto;
            Mensaje.Body = pMensaje;
            EnviarEmail();
        }

        //Envia el correo
        private void EnviarEmail()
        {
            string servidorEmailAdministrador = ConfigurationManager.AppSettings["ServidorEmailAdministrador"];
            int puertoServidorEmailAdministrador = Convert.ToInt32(ConfigurationManager.AppSettings["PuertoServidorEmailAdministrador"]);
            SmtpClient SMTPServicio = new SmtpClient(servidorEmailAdministrador, puertoServidorEmailAdministrador)
            {
                Credentials = new NetworkCredential(CuentaEmailAdministrador, ContraseniaEmailAdministrador),
                EnableSsl = true
            };
            SMTPServicio.Send(Mensaje);            
        }

        //Envia el correo de recuperacion de contraseña
        public void CorreoRecuperacionContrasenia(Usuario pUsuario)
        {
            //inicializa los parametros de envio del correo
            List<string> destinatarios = new List<string> { pUsuario.Email };
            string nuevaContraseniaDesencriptada = AdministradorCuentas.Instancia.DesencriptarContrasenia(pUsuario.Contrasenia);
            string asunto = "CarpoolingCo - Recuperación de cuenta";
            string mensaje = "Hemos generado un nueva contraseña que te permita el acceso. Por favor ingresa con esta contraseña y actulizada por seguridad.";
            mensaje += "<br/>Tu contraseña de ingreso es: " + nuevaContraseniaDesencriptada;
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador , destinatarios, null, null, asunto, mensaje, true);
        }

        //Envia el correo a los diferentes pasajeros del viaje
        public void CorreoCancelacionViaje(Viaje pViaje)
        {
            //inicializa los parametros de envio del correo
            List<string> destinatarios = pViaje.GetPasajeros().Select(p => p.Email).ToList();
            
            string asunto = "CarpoolingCo - Cancelación de un viaje";
            string mensaje = "El viaje con destino a la ciudad de: " + pViaje.GetCiudadDestino()
                + ", en el cual usted se encontraba como participante en uno de los trayectos, desafortunadamente ha sido cancelado. ";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        //Envia el correo a los diferentes pasajeros del viaje
        public void CorreoRespuestaPregunta(Pregunta pPregunta)
        {
            //inicializa los parametros de envio del correo
            List<string> destinatarios = new List<string> {pPregunta.CreadorPregunta.Email};

            string asunto = "CarpoolingCo - Han respondido tu pregunta";

            string mensaje = "A la pregunta: (" + pPregunta.TextoPregunta + ") el conductor del viaje ha respondido: " +
                             pPregunta.TextoRespuesta;
            mensaje += "<br/> Puedes ampliar la informacion del viaje ingresando a tu cuenta de CarpoolingCo";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        //Envia el correo con la pregunta que realizaron de un viaje
        public void CorreoPregunta(Pregunta pPregunta, Usuario tUsuario)
        {
            //inicializa los parametros de envio del correo
            List<string> destinatarios = new List<string> { tUsuario.Email };

            string asunto = "CarpoolingCo - Hay una nueva pregunta por responder en tu viaje";

            string mensaje = "El usuario: " + pPregunta.CreadorPregunta.ObtenerNombreApellidos() +
                             " tiene la siguiente pregunta en tu viaje: " + pPregunta.TextoPregunta;
            mensaje += "<br/> Puedes responder la pregunta en el deatlle del viaje, sección de preguntas de tu viaje.";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        //Envia el correo notificando calificacion pendiente al conductor
        public void CorreoCalificacionParticipante(Viaje pViaje, Usuario pUsuario)
        {
            //inicializa los parametros de envio del correo
            var destinatarios = new List<string> { pUsuario.Email };

            //TODO probar que el trayecto venga dentro de la solicitud y no solo el id del trayecto
            string asunto = "CarpoolingCo - Tienes un viaje por calificar";

            string mensaje = "Por favor califica el viaje con destino a la ciudad de: " + pViaje.GetCiudadDestino().Direccion + " , en el que participaste.";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        //Envia el correo notificando calificacion pendiente al pasajero
        public void CorreoCalificacionConductor(Viaje pViaje)
        {
            //inicializa los parametros de envio del correo
            List<string> destinatarios = new List<string> { pViaje.Conductor.Email };
            string asunto = "CarpoolingCo - Tienes un viaje por calificar‏";
            string mensaje = "Por favor califica a los pasajeros que viajaron contigo en el viaje con destino a la ciudad de: " + pViaje.GetCiudadDestino().Direccion;
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        public void CorreoSolicitudAprobada(Solicitud pSolicitud)
        {
            //inicializa los parametros de envio del correo
            var destinatarios = new List<string> { pSolicitud.CreadorSolicitud.Email };

            //TODO probar que el trayecto venga dentro de la solicitud y no solo el id del trayecto
            string asunto = "CarpoolingCo - Su solicitud fue aprobada";

            string mensaje = "Su solicitud para participar en un viaje" +
                             " ha sido aprobada.";
            mensaje += "<br/> Puedes ver mas informacion con relacion al viaje dentro del listado de tus viajes.";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        public void CorreoSolicitudRechazada(Solicitud pSolicitud)
        {
            //inicializa los parametros de envio del correo
            var destinatarios = new List<string> { pSolicitud.CreadorSolicitud.Email };

            //TODO probar que el trayecto venga dentro de la solicitud y no solo el id del trayecto
            string asunto = "CarpoolingCo - Su solicitud fue rechazada";

            string mensaje = "Su solicitud para participar en el viaje desde:" + pSolicitud.Trayecto.ParadaOrigen.Direccion +
                " hasta la ciudad de: " + pSolicitud.Trayecto.ParadaDestino.Direccion +
                             " ha sido rechazada.";

            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }

        public void CorreoParticipacionCancelada(Viaje pvViaje, Solicitud pSolicitud)
        {
            //inicializa los parametros de envio del correo
            var destinatarios = new List<string> { pvViaje.Conductor.Email };

            string asunto = "CarpoolingCo - Participacion cancelada";

            string mensaje = "El participante: " + pSolicitud.CreadorSolicitud.ObtenerNombreApellidos() +
                             " ha decidido cancelar la participación en uno de tus viajes, desde la ciudad de: " +
                             pvViaje.GetCiudadOrigen().Direccion +
                             " hasta la ciudad de: " + pvViaje.GetCiudadDestino().Direccion;

            mensaje += "<br/> Puedes ver mas informacion con relacion al viaje dentro del listado de tus viajes.";
            mensaje += "<br/><br/>Gracias por hacer parte de CarpoolingCo.";
            EnviarCorreoPlano(CuentaEmailAdministrador, destinatarios, null, null, asunto, mensaje, true);
        }
    }
}
