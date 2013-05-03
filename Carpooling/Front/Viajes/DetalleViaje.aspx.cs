using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Viajes
{
    public partial class DetalleViaje : System.Web.UI.Page
    {
        public Viaje ViajeDetalle { get; set; }

        public long IdViaje { get; set; }

        public string CiudadOrigen { get; set; }

        public string CiudadDestino { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            string idViajeStr = Request.QueryString["idViajeDetalle"];
            if (idViajeStr != null)
            {
                IdViaje = Convert.ToInt64(idViajeStr);
                ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
                PintarDetalleViaje();
                CrearHiddenFields();
            }
        }

        public void PintarDetalleViaje()
        {
            //Informacion del viaje
            //txtCiudadDestino.Text = ViajeDetalle.GetCiudadDestino().Direccion;
            //txtCiudadOrigen.Text = ViajeDetalle.GetCiudadOrigen().Direccion;
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy") + " (mm/dd/yyyy)";
            txtHora.Text = String.Format("{0:HH:mm}", ViajeDetalle.FechaHoraPartida) + " (24h)";
            txtTarifa.Text = "$"+ViajeDetalle.AporteEconomico+" COP";
            
            //Informacion del conductor
            txtNombreConductor.Text = ViajeDetalle.Conductor.Nombre;
            //TODO agregar mas informacion del conductor


            //Informacion del trayecto selecionado el trayecto seleccionado
            dataListTrayectos.DataSource = ViajeDetalle.TrayectosViaje;
            dataListTrayectos.DataBind();

            //Informacion de las Paradas
            dataListParada.DataSource = ViajeDetalle.GetParadas();
            dataListParada.DataBind();
        }

        private void CrearHiddenFields()
        {
            
            var hiddenCiudadOrigen = new HtmlInputHidden
                                         {ID = "txtCiudadOrigen", Value = ViajeDetalle.GetCiudadOrigen().Direccion};
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadOrigen);
            
            var hiddenCiudadDestino = new HtmlInputHidden
                                          {ID = "txtCiudadDestino", Value = ViajeDetalle.GetCiudadDestino().Direccion};
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadDestino);
            
            int count = 1;
            foreach (Parada parada in ViajeDetalle.GetParadasSinOrigenDestino())
            {
                var hiddenParada = new HtmlInputHidden {Name = "txbParada" + count, Value = parada.Direccion};
                this.contenedorHiddenFields.Controls.Add(hiddenParada);
                count++;
            }
            
            
        }
    }
}