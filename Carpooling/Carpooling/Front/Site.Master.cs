using System;
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
                usuarioApp = AdministradorCuentas.Instancia.AutenticarUsuario(nombreEmailUsuario, contrasenia);
                if (usuarioApp != null)
                {
                    Session["usuario"] = usuarioApp;
                    if (usuarioApp.Foto != null)
                    {
                        var cacheImagenFolder = ConfigurationManager.AppSettings["CacheImagenFolder"];
                        cacheImagenFolder = Server.MapPath("/" + cacheImagenFolder + "/");
                        var imagenCuenta = AdministradorCuentas.Instancia.ObtenerImageFromBinary(usuarioApp.Foto);
                        var fileName = AdministradorCuentas.Instancia.GuardarImagenSever(imagenCuenta, cacheImagenFolder, usuarioApp.IdUsuario);
                        Session["imagenUsuario"] = fileName;
                    }

                    string nombreMostrarUsuario = usuarioApp.Nombre + " " + usuarioApp.Apellido;
                    nombreMostrarUsuario = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower()) + " (" + usuarioApp.IdUsuario + ")";

                    FormsAuthentication.RedirectFromLoginPage(nombreMostrarUsuario, false);
                }
                else
                {
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
