using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Negocio;

namespace Carpooling.Front.UserControls
{
    public partial class PopUpConfrimarCupos : System.Web.UI.UserControl
    {

        public string MensajePopUp { get { return lblTextoMensaje.Text; } set { lblTextoMensaje.Text = value; } }

        public string TituloMensaje { get { return lblTitulo.Text; } set { lblTitulo.Text = value; } }

        public delegate void ClickEventHandler(object sender, EventArgs e);

        public event ClickEventHandler OnClickAceptar = delegate { };

        public int NumeroCupos { get { return Convert.ToInt32(txbCuposSolicitados.Text); } }

        public string Comentario { get { return txbComentario.Text; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ClickPadre(object sender, EventArgs e)
        {
            OnClickAceptar(this, e);
        }

        public void MostrarVentana()
        {
            mpeMensajes.Show();
        }

        public void CerrarVentana()
        {
            mpeMensajes.Hide();
        }

    }
}