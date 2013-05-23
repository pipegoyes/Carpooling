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
            panelError.Visible = false;
            panelExitoso.Visible = false;
        }

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

            if (AdministradorViajes.Instancia.RegistrarSolicitud(solicitudNueva))
            {
                panelExitoso.Visible = true;
                HabilitarPopUp(false);
            }
            else
                panelError.Visible = true;
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