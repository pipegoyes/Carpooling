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
                    txbContraseniaActual.Text = mensaje;
                    return;
                }
                CerrarVentana();
            }
        }
    }
}