using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Viajes
{
    public partial class DetalleViaje : System.Web.UI.Page
    {
        public Viaje ViajeDetalle { get; set; }

        public long IdViaje { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string idViajeStr = Request.QueryString["idViajeDetalle"];
            IdViaje = Convert.ToInt64(idViajeStr);
            ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
            PintarDetalleViaje();
        }

        public void PintarDetalleViaje()
        {
            //Informacion del viaje
            txtCiudadDestino.Text = ViajeDetalle.GetCiudadDestino().Direccion;
            txtCiudadOrigen.Text = ViajeDetalle.GetCiudadOrigen().Direccion;
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy") + " (MM/dd/yyyy)";
            txtHora.Text = ViajeDetalle.FechaHoraPartida.ToString("HH:mm ");
            
            //Informacion del conductor
            txtNombreConductor.Text = ViajeDetalle.Conductor.Nombre;

            //pendiente el trayecto seleccionado
            //txtCupos

            //Informacion de las Paradas
            dataListParada.DataSource = ViajeDetalle.GetParadasSinOrigenDestino();
            dataListParada.DataBind();
        }
    }
}