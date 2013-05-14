using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace Carpooling.Front.Cuentas
{
    public partial class RecuperarContrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            AdministradorCuentas.Instancia.RecuperarContrasenia(txbIdEmailUsuario.Text);
        }
    }
}