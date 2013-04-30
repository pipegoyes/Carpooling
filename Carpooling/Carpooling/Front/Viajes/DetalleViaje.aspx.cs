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
        }
    }
}