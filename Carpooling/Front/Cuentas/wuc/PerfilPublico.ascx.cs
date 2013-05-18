using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Carpooling.Front.Cuentas.wuc
{
    public partial class PerfilPublico : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MostrarVentana()
        {
            mpePerfilPublico.Show();
        }

        public void CerrarVentana()
        {
            mpePerfilPublico.Hide();
        }
    }
}