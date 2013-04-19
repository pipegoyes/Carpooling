using System;
using System.Web;
using System.Web.Services;
using BusinessLayer;
using Entities.Aplicacion;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
{
    public partial class PublicarViaje : System.Web.UI.Page
    {
        public ViajeJSON ViajeEnCreacion { get; set; }

        public static Usuario UsuarioCreador { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //List<int> listHoras = Enumerable.Range(00, 24).ToList();
            //List<int> listMinutos = Enumerable.Range(00, 59).ToList();
            //this.comboBoxHour.DataSource = listHoras;
            //this.comboBoxMinutos.DataSource = listMinutos;
            //this.btnRolConductor.Checked
            //Server.Transfer();
        }

        [WebMethod]
        public static string PublicarViajeAsynch(ViajeJSON viajeJson)
        {
            try
            {
                var usuarioConectado = new Usuario()
                                           {
                                               IdUsuario = "manuellinares007"
                                           };
                long idViaje = AdministradorViajes.PublicarViaje(viajeJson, usuarioConectado);
                return idViaje.ToString();
            }
            catch (Exception exception)
            {
                return "Error del sistema - " + exception.Message;
            }
            //return "Origen del viaje - " + viajeJson.AporteEconomico; ;
        }

    }
}