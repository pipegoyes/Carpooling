﻿using System;
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
    }
}
