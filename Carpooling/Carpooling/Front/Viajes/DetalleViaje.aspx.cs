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
                bool desdeBusqueda = !String.IsNullOrWhiteSpace(Request.QueryString["b"]);
                if (desdeBusqueda)
                    btnCancelarParticipacion.Visible = false;
                Session["idViajeDetalle"] = long.Parse(idViajeStr);
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
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy HH:mm");
            txtTarifa.Text = "$"+ViajeDetalle.AporteEconomico+" COP";
            txbOrigen.Text = ViajeDetalle.GetCiudadOrigen().Direccion;
            txbDestino.Text = ViajeDetalle.GetCiudadDestino().Direccion;

            //Informacion del conductor
            txbNombreConductor.Text = ViajeDetalle.Conductor.ObtenerNombreApellidos();
            
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
            
            int[] count = {1};
            foreach (var hiddenParada in ViajeDetalle.GetParadasSinOrigenDestino().Select(parada => new HtmlInputHidden 
            {ID = "txbParada" + count[0], Value = parada.Direccion}))
            {
                this.contenedorHiddenFields.Controls.Add(hiddenParada);
                count[0]++;
            }
        }

        private void HabilitarPopUp(bool habilitado)
        {
            txbComentario.Enabled = habilitado;
            txbCuposSolicitados.Enabled = habilitado;
            //TODO cuando el boton no es enable no se nota en la UI
            btnAceptarPopUp.Enabled = habilitado;

            if (!habilitado) return;
            txbComentario.Text = "";
            txbCuposSolicitados.Text = "";
            txbCuposSolicitados.Enabled = true;
            txbComentario.Enabled = true;
            panelError.Visible = false;
            panelExitoso.Visible = false;
        }

        #region CancelarParticipacion

        protected void ShowPopUpCancelarParticipacion(object sender, EventArgs e)
        {
            panelMensajeCancelacionPopup.Visible = false;
            mpeConfirmarCancelacion.Show();
        }

        protected void AceptarPopUpCancelarParticipacion(object sender, EventArgs e)
        {
            string idViajeStr = Request.QueryString["idViajeDetalle"];
            var participante = (Usuario) Session["usuario"];
            long idViaje = Convert.ToInt32(idViajeStr);
            var result = AdministradorSolicitudes.Instancia.CancelarParticipacion(idViaje, participante);
            if(result)
                Response.Redirect("~/Front/Bienvenida.aspx");
            else
                panelMensajeCancelacionPopup.Visible = true;
        }

        protected void HidePopUpCancelarParticipacion(object sender, EventArgs e)
        {
            mpeConfirmarCancelacion.Hide();
        }

        #endregion

        #region Participar
        protected void ShowPopUpParticipar(object sneder, DataListCommandEventArgs e)
        {
            if (!e.CommandName.ToLower().Equals("participar")) return;
            long idTrayecto = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
            Session["idTrayecto"] = idTrayecto;
            HabilitarPopUp(true);
            mpeMensajes.Show();
        }

        protected void BtnEnviarSolicitud(object sender, EventArgs eventArgs)
        {
            var pasajero = (Usuario)Session["usuario"];
            var idTrayecto = (long)Session["idTrayecto"];
            var solicitudNueva = new Solicitud()
            {
                Comentario = txbComentario.Text,
                CuposSolicitados = int.Parse(txbCuposSolicitados.Text),
                Estado = Solicitud.SolicitudEstado.Pendiente,
                CreadorSolicitud = pasajero,
                IdTrayecto = idTrayecto
            };

            if(AdministradorViajes.Instancia.HayCuposSuficientes(solicitudNueva,idTrayecto))
            {
                if (AdministradorViajes.Instancia.RegistrarSolicitud(solicitudNueva))
                {
                    panelExitoso.Visible = true;
                    HabilitarPopUp(false);
                }
                else
                {
                    lblMensajeError.Text = "No es posible enviar mas de una solicitud al mismo trayecto.";
                    txbCuposSolicitados.Enabled = false;
                    txbComentario.Enabled = false;
                    panelError.Visible = true;
                }                
            }
            else
            {
                lblMensajeError.Text = "No hay cupos suficientes en el trayecto que usted seleccionó.";
                txbCuposSolicitados.Enabled = false;
                txbComentario.Enabled = false;
                panelError.Visible = true; 
            }

                
        }

        protected void HidePopUpParticipar(object sender, EventArgs e)
        {
            panelExitoso.Visible = false;
            panelError.Visible = false;
            mpeMensajes.Hide();
        }

        #endregion 

        #region Preguntar
        protected void ShowPopUpRespuesta(object sender, EventArgs e)
        {
           mpePreguntar.Show();
        }

        protected void BtnRealizarPregunta(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txbPregunta.Text))
            {
                var pregunta = new Pregunta()
                    {
                        IdViaje = (long)Session["idViajeDetalle"],
                        CreadorPregunta = (Usuario) Session["usuario"],
                        TextoPregunta = txbPregunta.Text
                    };
                if (AdministradorPreguntas.Instancia.RealizarPregunta(pregunta))
                {
                    panelPreguntaRespuestaExt.Visible = true;
                    panelPreguntaRespuestaErr.Visible = false;
                }
            }
            else
            {
                panelPreguntaRespuestaExt.Visible = false;
                panelPreguntaRespuestaErr.Visible = true;
            }
        }

        protected void HidePopUpRespuesta(object sender, EventArgs e)
        {
            mpePreguntar.Hide();
        }
        #endregion
    }
}