using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Carpooling.Front.UserControls
{
    public partial class PopUpOk : System.Web.UI.UserControl
    {
        public string MensajePrincipal { get { return lblTextoMensaje.Text; } set { lblTextoMensaje.Text = value; } }

        public string TituloPopUp { get { return lblTitulo.Text; } set { lblTitulo.Text = value; } }

        public bool TransaccionExitosa { get; set; }

        public delegate void OnClickEventHandler(object sender, EventArgs e);

        public event OnClickEventHandler OnClickAceptar = delegate { };

        protected void OnClickPadre(object sender, EventArgs e)
        {
            OnClickAceptar(this, e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MostrarPopUp()
        {
            mpePopUpOk.Show();
        }

        public void CerrarPopUp()
        {
            mpePopUpOk.Hide();
        }

    }
}