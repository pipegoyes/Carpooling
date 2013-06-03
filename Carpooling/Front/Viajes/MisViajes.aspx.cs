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

                    //Viajes vigentes como conductor
                    var misViajesVigentes = listaMisViajes.FindAll(v => v.Estado == Viaje.ViajeEstado.Publicado);
                    dataListViajesVigentesConductor.DataSource = AdministradorViajes.Instancia.ToListItemTabla(misViajesVigentes);
                    dataListViajesVigentesConductor.DataBind();

                    //Viajes vigentes como pasajero 
                    var misParticipacionesVigentes =
                        AdministradorViajes.Instancia.BuscarViajesVigentesPasajero(UsuarioActivo);
                    dataListViajesVigentesPasajero.DataSource =
                        AdministradorViajes.Instancia.ToListItemTabla(misParticipacionesVigentes);
                    dataListViajesVigentesPasajero.DataBind();

                    //Viajes realizados
                    var misViajesRealizados = listaMisViajes.FindAll(v => v.Estado == Viaje.ViajeEstado.Realizado);
                    dataListViajesRealizados.DataSource = AdministradorViajes.Instancia.ToListItemTabla(misViajesRealizados);
                    dataListViajesRealizados.DataBind();
                }
            }
        }

        protected void BtnVerDetalleClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("verdetallevigente"))
            {
                //TODO aqui hay q enviar un parametro para q no se pueda calificar participantes
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje_MisViajes.aspx?idViajeDetalle=" + id);
            }
            else if (e.CommandName.ToLower().Equals("verdetallerealizado"))
            {
                //TODO aqui hay q enviar un parametro para q se pueda calificar participantes
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje_MisViajes.aspx?idViajeDetalle=" + id);
            }
        }

    }
} 