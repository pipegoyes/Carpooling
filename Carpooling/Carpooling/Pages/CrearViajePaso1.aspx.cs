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
            //List<int> listHoras = Enumerable.Range(00, 24).ToList();
            //List<int> listMinutos = Enumerable.Range(00, 59).ToList();
            //this.comboBoxHour.DataSource = listHoras;
            //this.comboBoxMinutos.DataSource = listMinutos;
            //this.btnRolConductor.Checked
        }

        [WebMethod]
        public static string PublicarViajeAsynch(Viaje request)
        {


            return "Origen del viaje - " + request.Tarifa; ;
        }

    }
}