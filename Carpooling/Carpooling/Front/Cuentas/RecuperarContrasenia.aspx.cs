using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Aplicacion;

namespace Carpooling.Front.Cuentas
{
    public partial class RecuperarContrasenia : System.Web.UI.Page
    {
        string formulario;
        protected void Page_Load(object sender, EventArgs e)
        {
            formulario = this.Request.QueryString["formulario"].ToString();
            if (formulario.Equals("contrasenia"))
            {
                Titulo.Text = "Restablecer contraseña";
                Mensaje.Text = "Introduzca el nombre de usuario o el correo electronico con el que se ha registrado. En breve, recibirá un mensaje de correo electrónico con la información de su cuenta.";
                btnRecuperar.Text = "Recuperar contraseña";
            }
            else
            {
                Titulo.Text = "Activar cuenta";
                Mensaje.Text = "Introduzca el nombre de usuario o el correo electronico con el que se ha registrado. En breve, reactivaremos su cuenta.";
                btnRecuperar.Text = "Activar cuenta";
            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
                if (formulario.Equals("contrasenia"))
                {
                    AdministradorCuentas.Instancia.RecuperarContrasenia(txbIdEmailUsuario.Text);
                }
                else
                {
                    AdministradorCuentas.Instancia.ActivarCuenta(txbIdEmailUsuario.Text);
                }
                
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }
    }
}