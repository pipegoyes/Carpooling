using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.BussinessObjects;
namespace Carpooling
{
    public partial class CrearViajePaso1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string PublicarViajeAsynch(Viaje request)
        {
            return "Origen del viaje - " + request.Origin;
        }

    }
}