using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                    string nombreMostrarUsuario = usuarioApp.Nombre + " " + usuarioApp.Apellido;
                    nombreMostrarUsuario = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower());
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
