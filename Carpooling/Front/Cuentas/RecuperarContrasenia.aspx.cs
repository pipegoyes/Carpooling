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
                panelExitoso.Visible = panelError.Visible = false;

                if (formulario.Equals("contrasenia"))
                {
                    if (AdministradorCuentas.Instancia.RecuperarContrasenia(txbIdEmailUsuario.Text))
                    {
                        lblMensajeExitoso.Text = "Hemos enviado una nueva contraseña a su correo electronico.";
                        panelExitoso.Visible = true;
                    }
                    else
                    {
                        lblMensajeError.Text = "No hemos podido enviar un correo electronico su la nueva contraseña. Intentelo nuevamente.";
                        panelError.Visible = true;
                    }
                }
                else
                {
                    if (AdministradorCuentas.Instancia.ActivarCuenta(txbIdEmailUsuario.Text))
                    {
                        lblMensajeExitoso.Text = "Hemos reactivado su cuenta en Carpooling Colombia.";
                        panelExitoso.Visible = true;
                    }
                    else
                    {
                        lblMensajeError.Text = "No hemos podido reactivar su cuenta. Intentelo nuevamente.";
                        panelError.Visible = true;
                    }
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