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
                    if (usuarioApp == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "divvv", "positionDivLog('Nombre de usuario inexistente.');", true);
                    }
                    else if (usuarioApp.Estado == UsuarioEstado.Inactivo)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "divvv", "positionDivLog('La cuenta se encuentra inactiva.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "divvv", "positionDivLog('La contraseña es incorrecta.');", true);
                    }
                }
            }
            catch (Exception)
            {                
                throw;
            }
        }
    }
}
