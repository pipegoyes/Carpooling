using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Cuentas.wuc
{
    public partial class CambioContrasenia : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MostrarVentana()
        {
            panelExitoso.Visible = false;
            panelError.Visible = false;
            panelBotonesRespuesta.Visible = false;
            panelBotonesPrincipales.Visible = true;
            datosFormulario.Visible = true;
            mpeCambioContrasenia.Show();
        }

        public void CerrarVentana()
        {
            mpeCambioContrasenia.Hide();
        }

        protected void btnGuardarContrasenia_Click(object sender, EventArgs e)
        {
            Usuario usuarioApp = (Usuario)Session["usuario"];
            if (!string.IsNullOrEmpty(txbContraseniaActual.Text) || !string.IsNullOrEmpty(txbNuevaContrasenia.Text) || !string.IsNullOrEmpty(txbReNuevaContrasenia.Text))
            {
                string mensaje;
                if (!AdministradorCuentas.Instancia.ActualizarContrasenia(usuarioApp, txbContraseniaActual.Text.Trim(), txbNuevaContrasenia.Text.Trim(), out mensaje))
                {
                    panelExitoso.Visible = false;
                    panelError.Visible = true;
                }
                else
                {
                    usuarioApp.Contrasenia = txbNuevaContrasenia.Text.Trim();
                    panelError.Visible = false;
                    panelExitoso.Visible = true;
                }
                panelBotonesRespuesta.Visible = true;
                panelBotonesPrincipales.Visible = false;
                datosFormulario.Visible = false;
                //CerrarVentana();
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            mpeCambioContrasenia.Hide();
        }
    }
}