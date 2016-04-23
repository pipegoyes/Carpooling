using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Aplicacion;

namespace Carpooling.Front
{
    public partial class Error : System.Web.UI.Page
    {
        private ErrorAplicacion error;

        protected void Page_Load(object sender, EventArgs e)
        {
            error = ((Global)this.Context.ApplicationInstance).ErrorExcepcion;
            lblTituloError.Text = error.TituloError;
            lblDetalleError.Text = error.DetalleError;
        }
    }
}