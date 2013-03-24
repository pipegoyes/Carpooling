using System;
using System.Web.Services;
using BusinessLayer.ServiciosViaje;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
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
            CreadorViajes.CrearViajeEntity(request);

            return "Origen del viaje - " + request.AporteEconomico; ;
        }

    }
}