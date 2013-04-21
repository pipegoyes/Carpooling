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
            Usuario usuarioApp;
            try
            {
                string nombreEmailUsuario = Request.Form["hfdNombreUsuario"];
                string contrasenia = Request.Form["hfdContrasenia"];

                //string nombreEmailUsuario = hfdNombreUsuario.Value;
                //string contrasenia = hfdContrasenia.Value;

                    usuarioApp = AdministradorCuentas.Instancia.AutenticarUsuario(nombreEmailUsuario, contrasenia);
                if (usuarioApp != null)
                {
                    string nombreMostrarUsuario = usuarioApp.Nombre + " " + usuarioApp.Apellido;
                    nombreMostrarUsuario = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower());
                    FormsAuthentication.RedirectFromLoginPage(nombreMostrarUsuario, false);
                }
                else
                {
                    //hfdNombreUsuario.Value = "";
                    //hfdContrasenia.Value = "";
                }
            }
            catch (Exception)
            {                
                throw;
            }
        }
    }
}
