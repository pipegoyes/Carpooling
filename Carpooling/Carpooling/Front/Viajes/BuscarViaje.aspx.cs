using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI.WebControls;
using Entities.Negocio;
using Entities.Aplicacion;
using BusinessLayer;

namespace Carpooling.Front.Viajes 
{
    public partial class BuscarViaje : System.Web.UI.Page
    {
        public Usuario UsuarioAutenticado { get; set; }
        public List<ItemTablaViaje> ViajesEncontrados { get; set; }
        public string CiudadOrigen { get; set; }
        public string CiudadDestino { get; set; }
        public DateTime FechaViaje { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO utilizando variables de sesion buscar el usuario conectado
            if (this.IsCallback)
                CiudadDestino = CiudadDestino;
        }

        protected void btnBuscarViaje_Click(object sender, EventArgs e)
        {
            //TODO la fecha aun no es tenida en cuenta
            CiudadOrigen = txbCiudadOrigen.Text;
            CiudadDestino = txbCiudadDestino.Text;
            FechaViaje = DateTime.ParseExact(calendarFechaViaje.Text, "MM/dd/yyyy", null);
            ViajesEncontrados = AdministradorViajes.Instancia.BuscarViaje(CiudadOrigen, CiudadDestino, FechaViaje);

            this.dataListItemsViajesEncontrados.DataSource = ViajesEncontrados;
            this.dataListItemsViajesEncontrados.DataBind();
            
        }

        protected void btnVerDetalle_Click(object sneder, DataListCommandEventArgs e)
        {
            if(e.CommandName.ToLower().Equals("verdetalle"))
            {
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje.aspx?idViajeDetalle=" + id);
            }
        }

    }
}