using System;
using Entities.Aplicacion;

namespace Carpooling.Front.Viajes
{
    public partial class PublicacionViajeExitosa : System.Web.UI.Page
    {
        public ViajeJSON ViajeCreado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var req = Request.QueryString["idViaje"];
        }
    }
}