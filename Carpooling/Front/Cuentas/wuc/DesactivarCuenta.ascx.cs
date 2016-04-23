using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Cuentas.wuc
{
    public partial class DesactivarCuenta : System.Web.UI.UserControl
    {
        private bool desactivarCuenta 
        { 
            get
            {
                return (bool)ViewState["desactivarCuenta"];
            }
            set
            {
                ViewState["desactivarCuenta"] = value;
            } 
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptarCancelacionPopUp_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);

            Usuario usuarioSesion = (Usuario)Session["usuario"];
            desactivarCuenta = AdministradorCuentas.Instancia.DesactivarCuenta(usuarioSesion);
            panelMensaje.Visible = false;
            panelBotonesPrincipales.Visible = false;
            panelBotonesRespuesta.Visible = true;

            if (desactivarCuenta)
            {
                panelExitoso.Visible = true;
                panelError.Visible = false;
            }
            else
            {
                panelExitoso.Visible = false;
                panelError.Visible = true;
            }
        }

        public void MostrarVentana()
        {
            desactivarCuenta = false;
            panelError.Visible = false;
            panelExitoso.Visible = false;
            panelBotonesPrincipales.Visible = true;
            panelMensaje.Visible = true;
            panelBotonesRespuesta.Visible = false;
            mpeDesactivarCuenta.Show();
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            if (desactivarCuenta)
            {
                Session.Clear();
                Session.Abandon();
                FormsAuthentication.SignOut();
            }
            else
            {
                mpeDesactivarCuenta.Hide();
            }
        }
    }
}