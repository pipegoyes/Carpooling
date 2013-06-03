﻿using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using Image = System.Drawing.Image;
using BusinessLayer;
using Entities.Negocio;
using System.Web.Security;
using System.Globalization;

namespace Carpooling.Front
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(3000);
            Usuario usuarioApp;
            try
            {
                string nombreEmailUsuario = Request.Form["hfdNombreUsuario"];
                string contrasenia = Request.Form["hfdContrasenia"];
                
                if (AdministradorCuentas.Instancia.AutenticarUsuario(nombreEmailUsuario, contrasenia, out usuarioApp))
                {
                    Session["usuario"] = usuarioApp;
                    AdministradorCuentas.Instancia.EliminarImagenTemporal(Server.MapPath("/"), usuarioApp.IdUsuario);
                    
                    string fileName;
                    if (usuarioApp.Foto != null)
                    {
                        var imagenCuenta = AdministradorCuentas.Instancia.ObtenerImageFromBinary(usuarioApp.Foto);
                        fileName = AdministradorCuentas.Instancia.GuardarImagenCuenta(imagenCuenta, Server.MapPath("/"), usuarioApp.IdUsuario);    
                    }
                    else 
                    {
                        fileName = usuarioApp.Genero == "H" ? ConfigurationManager.AppSettings["ImagenCuentaHombre"] : ConfigurationManager.AppSettings["ImagenCuentaMujer"];
                        fileName = Server.MapPath(fileName.Replace("~", ""));
                    }
                    Session["imagenUsuario"] = fileName;
    
                    string nombreMostrarUsuario = usuarioApp.ObtenerNombreApellidos() + " (" + usuarioApp.IdUsuario + ")";
                    FormsAuthentication.RedirectFromLoginPage(nombreMostrarUsuario, false);
                }
                else
                {
                    if (usuarioApp != null)
                    {
                        //TODO: mensaje que avisa que la cuenta esta desactivada
                    }
                    else 
                    {
                        //TODO: mensaje que avisa que la cuenta no existe (usuario o contraseña incorrectos)
                    }
                    //TODO: actualizar un hiddenfield desde aca con el estado de logue no exitoso y luego por JS mostrar un mensaje dependiendo valor del hiddenfield
                    //WebControl divLoginForm = (WebControl)this.FindControl("divLoginFormFloat");
                    //divLoginForm.Style.Add("display", "block");
                }
            }
            catch (Exception)
            {                
                throw;
            }
        }
    }
}
