using System;
using System.Collections.Generic;
using System.Globalization;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Viajes 
{
    public partial class BuscarViaje : System.Web.UI.Page
    {
        public Usuario UsuarioAutenticado { get; set; }
        public List<Viaje> ViajesEncontrados { get; set; }
        public string CiudadOrigen { get; set; }
        public string CiudadDestino { get; set; }
        public DateTime FechaViaje { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO utilizando variables de sesion buscar el usuario conectado
        }

        protected void btnBuscarViaje_Click(object sender, EventArgs e)
        {
            //TODO la fecha aun no es tenida en cuenta
            CiudadOrigen = txbCiudadOrigen.Text;
            CiudadDestino = txbCiudadDestino.Text;
            FechaViaje = DateTime.ParseExact(calendarFechaViaje.Text, "MM/dd/yyyy",null);
            this.dataListItemsViajesEncontrados.DataSource = AdministradorViajes.Instancia.BuscarViaje(CiudadOrigen, CiudadDestino,FechaViaje);
            this.dataListItemsViajesEncontrados.DataBind();
            
        }

    }
}