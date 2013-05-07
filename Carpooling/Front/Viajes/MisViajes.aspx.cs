using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Negocio;
using Entities.Aplicacion;
using BusinessLayer;

namespace Carpooling.Front.Viajes
{
    public partial class MisViajes : System.Web.UI.Page
    {
        public Usuario UsuarioActivo { get; set; }

        //public List<Viaje> MisViajesList { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                UsuarioActivo = (Usuario) Session["usuario"];
                if (UsuarioActivo != null)
                {
                    var listaMisViajes = AdministradorViajes.Instancia.BuscarMisViajesVigentes(UsuarioActivo);
                    Session["MisViajesList"] = listaMisViajes;
                    if(!listaMisViajes.Any()) return;
                    var misViajesVigentes = listaMisViajes.FindAll(v => v.Estado == Viaje.ViajeEstado.Publicado);
                    dataListViajesVigentes.DataSource = AdministradorViajes.Instancia.ToListItemTabla(misViajesVigentes);
                    dataListViajesVigentes.DataBind();
                }
            }
        }

        protected void BtnVerSolicitudesClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("versolicitudes"))
            {
                var idViaje = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                Session["idViajeSelecionado"] = idViaje;
                var listaMisViajes = (List<Viaje>) Session["MisViajesList"];
                var viajeSeleccionado = listaMisViajes.Find(v => v.IdViaje == idViaje);
                dataListSolicitudes.DataSource =
                    AdministradorSolicitudes.Instancia.CreateItemSolicitud(viajeSeleccionado);
                dataListSolicitudes.DataBind();
                PanelSolicitudesDetalle.Visible = true;
            }
        }

        protected void BtnAceptarSolicitud(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("aceptarsolicitud"))
            {
                //TODO podria no encontrar el viaje o la solicitud 
                var idSolicitud = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                var idViajeSeleccionado = (long) Session["idViajeSelecionado"];
                var listaMisViajes = (List<Viaje>) Session["MisViajesList"];
                var viajeSeleccionado = listaMisViajes.Find(v => v.IdViaje == idViajeSeleccionado);
                Solicitud solicitudSeleccionada = null;
                foreach (var trayecto in viajeSeleccionado.TrayectosViaje)
                {
                    solicitudSeleccionada = trayecto.ListaSolicitudes.Find(t => t.IdSolicitud == idSolicitud);
                    if (solicitudSeleccionada != null)
                        break;
                }
                AdministradorSolicitudes.Instancia.AceparSolicitud(viajeSeleccionado,solicitudSeleccionada);

            }
        }
    }
} 