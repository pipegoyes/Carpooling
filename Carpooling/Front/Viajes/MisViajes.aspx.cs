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
                    var listMisViajesCompleta = new List<Viaje>();
                    var listMisViajesRealizadosCompleta = new List<Viaje>();

                    //Viajes como pasajero 
                    var listaMisViajesConductor = AdministradorViajes.Instancia.BuscarMisViajesConductor(UsuarioActivo);
                    if(listaMisViajesConductor != null)
                    {
                        //Viajes vigentes como conductor
                        var misViajesVigentes = listaMisViajesConductor.FindAll(v => v.Estado == Viaje.ViajeEstado.Publicado);
                        if(misViajesVigentes.Any())
                        {
                            dataListViajesVigentesConductor.DataSource = AdministradorViajes.Instancia.ToListItemTabla(misViajesVigentes);
                            dataListViajesVigentesConductor.DataBind();    
                        }
                        

                        //Viajes realizados como conductor
                        listMisViajesRealizadosCompleta.AddRange(listaMisViajesConductor.FindAll(v => v.Estado == Viaje.ViajeEstado.Realizado));

                        //Agregar al lista definitivo
                        listMisViajesCompleta.AddRange(listaMisViajesConductor);
                    }


                    //Viajes como pasajero 
                    var listMisViajesPasajero = AdministradorViajes.Instancia.BuscarViajesVigentesPasajero(UsuarioActivo);
                    if(listMisViajesPasajero !=null)
                    {
                        //Viajes vigentes como pasajero
                        var misViajesVigentesPasajero = listMisViajesPasajero.FindAll(v => v.Estado == Viaje.ViajeEstado.Publicado);
                        if(misViajesVigentesPasajero.Any())
                        {
                            dataListViajesVigentesPasajero.DataSource = AdministradorViajes.Instancia.ToListItemTabla(misViajesVigentesPasajero);
                            dataListViajesVigentesPasajero.DataBind();    
                        }
                        

                        //Viajes realizados como pasajero
                        listMisViajesRealizadosCompleta.AddRange(listMisViajesPasajero.FindAll(v => v.Estado == Viaje.ViajeEstado.Realizado));

                        listMisViajesCompleta.AddRange(listMisViajesPasajero);
                    }

                    if(listMisViajesRealizadosCompleta.Any())
                    {
                        dataListViajesRealizados.DataSource =
                            AdministradorViajes.Instancia.ToListItemTabla(listMisViajesRealizadosCompleta);
                        dataListViajesRealizados.DataBind();
                    }

                    Session["MisViajesList"] = listMisViajesCompleta;
                }
            }
        }

        protected void BtnVerDetalleClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("verdetalleconductor"))
            {
                //TODO aqui hay q enviar un parametro para q no se pueda calificar participantes
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje_MisViajes.aspx?idViajeDetalle=" + id);
            }
            else if (e.CommandName.ToLower().Equals("verdetallepasajero"))
            {
                long id = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                if (id != 0)
                    Response.Redirect("../Viajes/DetalleViaje.aspx?idViajeDetalle=" + id);
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