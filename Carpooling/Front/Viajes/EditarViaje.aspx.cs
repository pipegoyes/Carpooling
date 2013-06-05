using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
{
    public partial class EditarViaje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string idViajeStr = Request.QueryString["id"];
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
            string script = null;
            foreach (var parada in viajeEditable.GetParadasSinOrigenDestino())
            {
                script += "CrearParadaConCiudad('" + parada.Direccion + "'); ";
                //ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", "CrearParadaConCiudad('" + parada.Direccion + "');", true);    
            }
            //script += "GenerarRuta();";
            ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", script, true);
            //ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", "GenerarRuta();", true);
            
        }
    }
}