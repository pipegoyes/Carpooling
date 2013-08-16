using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Aplicacion;

namespace Carpooling.Front
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Front/Bienvenida.aspx",false);
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                AdministradorCorreosElectronicos.Instancia.CorreoFormularioContacto(txbCorreoElectronico.Text, txbMensaje.Text, txbAsunto.Text, txbNombreContacto.Text);
                pnlFormulario.Visible = false;
                pnlConfirmacion.Visible = true;
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion{TituloError = ex.Message, DetalleError = ex.StackTrace};
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
            
        }
    }
}