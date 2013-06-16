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
            UsuarioCreador = (Usuario) Session["usuario"];
        }

        [WebMethod]
        public static long PublicarViajeAsynch(ViajeJSON viajeJson)
        {
            try
            {
                if (UsuarioCreador != null)
                {
                    var idViaje = AdministradorViajes.Instancia.PublicarViaje(viajeJson, UsuarioCreador);
                    return idViaje;
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