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

        protected void BtnVerDetalleClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("verdetalle"))
            {
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje_MisViajes.aspx?idViajeDetalle=" + id);
            }
        }

    }
} 