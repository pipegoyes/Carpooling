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
        public static string PublicarViajeAsynch(ViajeJSON viajeJson)
        {
            try
            {
                if (UsuarioCreador != null)
                {
                    long idViaje = AdministradorViajes.Instancia.PublicarViaje(viajeJson, UsuarioCreador);
                    return idViaje.ToString();
                }
                else
                    //TODO Podria ser redireccionado a la pagina de registrarse
                    return "Debe ingresar a su cuenta para publicar viajes";
            }
            catch (Exception exception)
            {
                //TODO revisar como mostrar esto en pantalla
                return "Error del sistema - " + exception.Message;
            }
        }

    }
}