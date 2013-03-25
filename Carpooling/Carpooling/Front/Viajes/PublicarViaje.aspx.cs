using System;
using System.Web.Services;
using BusinessLayer;
using Entities.Aplicacion;

namespace Carpooling.Front.Viajes
{
    public partial class PublicarViaje : System.Web.UI.Page
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
        public static string PublicarViajeAsynch(ViajeJSON viajeJson)
        {
            AdministradorViajes.PublicarViaje(viajeJson, null);
            return"pendiente";
            //return "Origen del viaje - " + viajeJson.AporteEconomico; ;
        }

    }
}