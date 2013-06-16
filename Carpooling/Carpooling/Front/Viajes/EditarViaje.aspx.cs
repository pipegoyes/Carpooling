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

        protected void BtnCancelarClick(object sender, EventArgs e)
        {
            string idViajeStr = Request.QueryString["id"];
            Response.Redirect("../Viajes/DetalleViaje_MisViajes.aspx?idViajeDetalle=" + idViajeStr);
        }

        private void Paso2Viaje(Viaje viajeEditable)
        {
            txbCiudadOrigen.Text = viajeEditable.GetCiudadOrigen().Direccion;
            txbCiudadDestino.Text = viajeEditable.GetCiudadDestino().Direccion;

            txbCupos.Text = "0";
            txbFechaPartida.Text = viajeEditable.FechaHoraPartida.ToString("MM/dd/yyyy");
            txbHora.Text = viajeEditable.FechaHoraPartida.ToString("hh:mm tt").Replace(".","");
            txbTarifa.Text = Convert.ToInt32(viajeEditable.AporteEconomico).ToString();
            txbCupos.Text = viajeEditable.TrayectosViaje.First().CuposDisponibles.ToString();
        }

        private void CrearParadasViaje(Viaje viajeEditable)
        {
            var script = viajeEditable.GetParadasSinOrigenDestino().Aggregate<Parada, string>(null, (current, parada) => current + ("CrearParadaConCiudad('" + parada.Direccion + "'); "));
            ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", script, true);
            
        }

        [WebMethod]
        public static long GuardarCambiosAsynch(ViajeJSON viajeJson)
        {
            try
            {
                if (UsuarioCreador != null)
                {
                    var resultId = AdministradorViajes.Instancia.GuardarCambios(viajeJson, UsuarioCreador,
                                                                                IdViajeEditable);
                    if (resultId != 0)
                        return resultId;
                }
                return 0;
            }
            catch (Exception exception)
            {
                return -1;
            }
        }
    }
}