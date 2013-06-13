using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Aplicacion;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
{
    public partial class EditarViaje : System.Web.UI.Page
    {
        public static Usuario UsuarioCreador { get; set; }

        public static string IdViajeEditable { get; set;}

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                UsuarioCreador = (Usuario) Session["usuario"];
                string idViajeStr = Request.QueryString["id"];
                IdViajeEditable = idViajeStr;
                var idViaje = long.Parse(idViajeStr);
                var viajeEditable = AdministradorViajes.Instancia.VerDetalleViaje(idViaje);
                Session["viajeEditable"] = viajeEditable;
                CrearParadasViaje(viajeEditable);
                Paso2Viaje(viajeEditable);
            }
        }

        private void Paso2Viaje(Viaje viajeEditable)
        {
            txbCiudadOrigen.Text = viajeEditable.GetCiudadOrigen().Direccion;
            txbCiudadDestino.Text = viajeEditable.GetCiudadDestino().Direccion;

            txbCupos.Text = "0";
            txbFechaPartida.Text = viajeEditable.FechaHoraPartida.ToString("MM/dd/yyyy");
            txbHora.Text = viajeEditable.FechaHoraPartida.ToString("hh:mm tt").Replace(".","");
            txbTarifa.Text = viajeEditable.AporteEconomico.ToString();
            
        }

        private void CrearParadasViaje(Viaje viajeEditable)
        {
            var script = viajeEditable.GetParadasSinOrigenDestino().Aggregate<Parada, string>(null, (current, parada) => current + ("CrearParadaConCiudad('" + parada.Direccion + "'); "));
            //foreach (var parada in viajeEditable.GetParadasSinOrigenDestino())
            //    script += "CrearParadaConCiudad('" + parada.Direccion + "'); ";
            ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", script, true);
            
        }

        [WebMethod]
        public static string GuardarCambiosAsynch(ViajeJSON viajeJson)
        {
            try
            {
                if (UsuarioCreador != null)
                {
                    AdministradorViajes.Instancia.GuardarCambios(viajeJson, UsuarioCreador, IdViajeEditable);
                }
                throw new Exception("Su sesion ha caducado por favor intente de nuevo.");
            }
            catch (Exception exception)
            {
                throw new Exception("Error del sistema por favor re-intente mas tarde.");
            }
        }
    }
}