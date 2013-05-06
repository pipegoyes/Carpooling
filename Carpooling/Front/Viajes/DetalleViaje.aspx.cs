using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Viajes
{
    public partial class DetalleViaje : System.Web.UI.Page
    {
        public Viaje ViajeDetalle { get; set; }

        public long IdViaje { get; set; }

        public string CiudadOrigen { get; set; }

        public string CiudadDestino { get; set; }

        public Usuario UsuarioConectado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string idViajeStr = Request.QueryString["idViajeDetalle"];
            if (idViajeStr != null)
            {
                UsuarioConectado = (Usuario)Session["usuario"];
                IdViaje = Convert.ToInt64(idViajeStr);
                ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
                PintarDetalleViaje();
                CrearHiddenFields();
            }
        }

        public void PintarDetalleViaje()
        {
            //Informacion del viaje
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy") + " (mm/dd/yyyy)";
            txtHora.Text = String.Format("{0:HH:mm}", ViajeDetalle.FechaHoraPartida) + " (24h)";
            txtTarifa.Text = "$"+ViajeDetalle.AporteEconomico+" COP";
            
            //Informacion del conductor
            txtNombreConductor.Text = ViajeDetalle.Conductor.Nombre;
            //TODO agregar mas informacion del conductor


            //Informacion del trayecto selecionado el trayecto seleccionado
            dataListTrayectos.DataSource = ViajeDetalle.TrayectosViaje;
            dataListTrayectos.DataBind();

            //Informacion de las Paradas
            dataListParada.DataSource = ViajeDetalle.GetParadas();
            dataListParada.DataBind();
        }

        private void CrearHiddenFields()
        {
            
            var hiddenCiudadOrigen = new HtmlInputHidden
                                         {ID = "txbCiudadOrigen", Value = ViajeDetalle.GetCiudadOrigen().Direccion};
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadOrigen);
            
            var hiddenCiudadDestino = new HtmlInputHidden
                                          {ID = "txbCiudadDestino", Value = ViajeDetalle.GetCiudadDestino().Direccion};
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadDestino);
            
            int count = 1;
            foreach (var parada in ViajeDetalle.GetParadasSinOrigenDestino())
            {
                var hiddenParada = new HtmlInputHidden {ID = "txbParada" + count, Value = parada.Direccion};
                this.contenedorHiddenFields.Controls.Add(hiddenParada);
                count++;
            }
        }

        protected void btnVerParticipar_Click(object sneder, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("participar"))
            {
                long idTrayecto = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                Session["idTrayecto"] = idTrayecto;
                popUpConfirmarCupos.MostrarVentana();
            }
        }

        protected void BtnConfirmarCuposClick(object sender, EventArgs eventArgs)
        {
            var pasajero = (Usuario)Session["usuario"];
            var idTrayecto = (long)Session["idTrayecto"];
            var solicitudNueva = new Solicitud()
            {
                Comentario = popUpConfirmarCupos.Comentario,
                CuposSolicitados = popUpConfirmarCupos.NumeroCupos,
                Estado = Solicitud.SolicitudEstado.Pendiente,
                CreadorSolicitud = pasajero,
                IdTrayecto = idTrayecto
            };

            if (AdministradorViajes.Instancia.RegistrarSolicitud(solicitudNueva))
            {
                popUpConfirmation.TituloPopUp = "Transaccion exitosa";
                popUpConfirmation.TransaccionExitosa = true;
                popUpConfirmation.MensajePrincipal =
                    "Su solicitud fue realizado con exito. Recuerda que el propietario es el que finalmente decidi si eres aceptado dentro del viaje";
            }
            else
            {
                popUpConfirmation.TituloPopUp = "Transaccion invalida";
                popUpConfirmation.TransaccionExitosa = false;
                popUpConfirmation.MensajePrincipal =
                    "No puedes enviar mas de una solicitud para un mismo trayecto.";
            }
            popUpConfirmation.MostrarPopUp();
        }

        protected void FinalTransaccionClick(object sender, EventArgs e)
        {
            if(popUpConfirmation.TransaccionExitosa)
            {
                //TODO Definir hacia donde es el redireccionamiento
                Response.Redirect("../Viajes/MisViajes.aspx");
            }
            else
            {
                popUpConfirmarCupos.CerrarVentana();
                popUpConfirmation.CerrarPopUp();
            }
        }
    }
}