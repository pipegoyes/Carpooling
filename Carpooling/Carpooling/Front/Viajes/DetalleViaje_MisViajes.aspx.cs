using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BusinessLayer;
using Carpooling.Front.UserControls;
using Entities.Aplicacion;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
{
    public partial class DetalleViaje_MisViajes : System.Web.UI.Page
    {
        public Viaje ViajeDetalle { get; set; }

        public long IdViaje { get; set; }

        public string CiudadOrigen { get; set; }

        public string CiudadDestino { get; set; }

        public Usuario UsuarioConectado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var idViajeStr = Request.QueryString["idViajeDetalle"];
            try
            {

                if (idViajeStr == null) throw new Exception("Por favor re-ingrese a la aplicacón, su tiempo de sesiòn ha expirado.");
                UsuarioConectado = (Usuario)Session["usuario"];
                IdViaje = Convert.ToInt64(idViajeStr);
                ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
                Session["ViajeSeleccionado"] = ViajeDetalle;
                PintarDetalleViaje();
                PintarSolicitudes();
                PintarPreguntas();
                CrearHiddenFields();
            }
            catch (Exception ex)
            {
                var error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        public void PintarDetalleViaje()
        {
            //Informacion del viaje
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy HH:mm");
            txtTarifa.Text = "$" + ViajeDetalle.AporteEconomico + " COP";
            txbOrigen.Text = ViajeDetalle.GetCiudadOrigen().Direccion;
            txbDestino.Text = ViajeDetalle.GetCiudadDestino().Direccion;



            //Informacion del trayecto selecionado el trayecto seleccionado
            dataListTrayectos.DataSource = ViajeDetalle.TrayectosViaje;
            dataListTrayectos.DataBind();

            //Informacion de las Paradas
            dataListParada.DataSource = ViajeDetalle.GetParadas();
            dataListParada.DataBind();
        }

        private void CrearHiddenFields()
        {

            var hiddenCiudadOrigen = new HtmlInputHidden { ID = "txbCiudadOrigen", Value = ViajeDetalle.GetCiudadOrigen().Direccion };
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadOrigen);

            var hiddenCiudadDestino = new HtmlInputHidden { ID = "txbCiudadDestino", Value = ViajeDetalle.GetCiudadDestino().Direccion };
            this.contenedorHiddenFields.Controls.Add(hiddenCiudadDestino);

            int[] count = { 1 };
            foreach (var hiddenParada in ViajeDetalle.GetParadasSinOrigenDestino().Select(parada => new HtmlInputHidden { ID = "txbParada" + count[0], Value = parada.Direccion }))
            {
                this.contenedorHiddenFields.Controls.Add(hiddenParada);
                count[0]++;
            }
        }

        private void InicializarPopUpRespuesta()
        {
            panelError.Visible = false;
            panelExitoso.Visible = false;
            txbRespuesta.Text = "";
        }

        //Actualiza el listado de las solicitudes (Aprobadas y pendientes) segun el viaje seleccionado
        private void PintarSolicitudes()
        {
            if(ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            var listaSolicitudesItem = AdministradorSolicitudes.Instancia.CreateItemSolicitud(ViajeDetalle);
            
            if(listaSolicitudesItem.Count >0)
            {
                var solitudesPendientes =
                    listaSolicitudesItem.FindAll(s => s.Estado == Solicitud.SolicitudEstado.Pendiente);
                if(solitudesPendientes.Any())
                {
                    tabSolicitudes.InnerText =  "Solicitudes ("+solitudesPendientes.Count+")";
                    dataListSolicitudes.DataSource = solitudesPendientes;
                    dataListSolicitudes.DataBind();
                    lblSinSolicitudes.Visible = false;   
                }
                var solicitudesAprobadas =
                    listaSolicitudesItem.FindAll(s => s.Estado == Solicitud.SolicitudEstado.Aprobada);
                if(solicitudesAprobadas.Any())
                {
                    tabParticipantes.InnerText = "Participantes (" + solicitudesAprobadas.Count + ")";
                    dataListParticipantes.DataSource = solicitudesAprobadas;
                    dataListParticipantes.DataBind();
                    lblSinParticipantes.Visible = false;
                }
                else
                    lblSinParticipantes.Visible = true;
                
            }
            else
                lblSinSolicitudes.Visible = true;
            

            
        }

        private void PintarPreguntas()
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            if(ViajeDetalle.Preguntas.Count> 0)
            {
                tabPreguntas.InnerText = (ViajeDetalle.Preguntas.Any(p => String.IsNullOrWhiteSpace(p.TextoRespuesta)))
                                             ? "Preguntas (" +
                                               ViajeDetalle.Preguntas.FindAll(
                                                   p => String.IsNullOrWhiteSpace(p.TextoRespuesta)).Count+")"
                                             : "Preguntas"; 
                dataListPreguntas.DataSource = AdministradorPreguntas.Instancia.CreateItemPregunta(ViajeDetalle);
                dataListPreguntas.DataBind();
                lblSinPreguntas.Visible = false;
            }
            else
                lblSinPreguntas.Visible = true;
            
        }

        //Dentro del listado de mis viajes localizado en las variables de sesion busca la solicitud
        private Solicitud BuscarSolicitud(long idSolicitud)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];
            foreach (var solicitudSeleccionada in ViajeDetalle.TrayectosViaje.Select(
                trayecto => trayecto.ListaSolicitudes.Find(t => t.IdSolicitud == idSolicitud)).Where(solicitudSeleccionada => solicitudSeleccionada != null))
            {
                return solicitudSeleccionada;
            }
            throw new Exception("Error buscando la solicitud dentro de los trayectos del viaje");
        }

        private void MostrarPopUpCOnfirmacion(bool transaccionExitosa, string mensaje)
        {
            popUpConfirmacionSolicitud.MensajePrincipal = mensaje;
            popUpConfirmacionSolicitud.TransaccionExitosa = transaccionExitosa;
            popUpConfirmacionSolicitud.TituloPopUp = transaccionExitosa ? "Transacción Exitosa" : "Transacción fallida";
            popUpConfirmacionSolicitud.MostrarPopUp();
        }

        protected void BtnCancelarViaje(object sender, EventArgs e)
        {
            mpeConfirmarCancelacion.Show();
        }

        protected void BtnAceptarRechazarSolicitud(object sender, DataListCommandEventArgs e)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];
            if (e.CommandName.ToLower().Equals("aceptarsolicitud"))
            {
                var idSolicitud = long.Parse(((LinkButton)e.CommandSource).CommandArgument);
                var solicitudSeleccionada = BuscarSolicitud(idSolicitud);
                if (AdministradorSolicitudes.Instancia.AceparSolicitud(ViajeDetalle, solicitudSeleccionada))
                {
                    PintarSolicitudes();
                    MostrarPopUpCOnfirmacion(true, "Se han actualizado los cupos de tu viaje exitosamente.");
                }
                else
                    MostrarPopUpCOnfirmacion(false, "No se ha podido actualizar los cupos de tu viaje, por favor intenta de nuevo, si el problema persiste conteactese con servicio al cliente.");

            }
            else if (e.CommandName.ToLower().Equals("rechazarsolicitud"))
            {
                var idSolicitud = long.Parse(((LinkButton)e.CommandSource).CommandArgument);
                var solicitudRechazada = BuscarSolicitud(idSolicitud);
                if (AdministradorSolicitudes.Instancia.RechazarSolicitud(solicitudRechazada))
                {
                    PintarSolicitudes();
                    MostrarPopUpCOnfirmacion(true, "La solicitud ha sido rechazada exitosamente, además el usuario será notificado via email.");
                }
                else
                    MostrarPopUpCOnfirmacion(false, "Presentamos inconvenientes en nuestra aplicacion, por favor realice esta acción nuevamente.");
            }
        }

        protected void BtnResponderClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("responder"))
            {
                var idPreguntaSeleccionada = long.Parse(((LinkButton)e.CommandSource).CommandArgument);
                var preguntaSeleccionada = ViajeDetalle.Preguntas.Find(p => p.IdPregunta == idPreguntaSeleccionada);
                Session["preguntaSeleccionada"] = preguntaSeleccionada;
                lblPregunta.Text = preguntaSeleccionada.TextoPregunta;
                InicializarPopUpRespuesta();
                mpeResponder.Show();
            }
        }

        protected void BtnCancelarPopUpResponder(object sender, EventArgs e)
        {
            mpeResponder.Hide();
        }

        #region Aceptar del popup de un solo boton

        protected void AceptarPopUpResponder(object sender, EventArgs e)
        {
            var preguntaSeleccionada = (Pregunta)Session["preguntaSeleccionada"];
            preguntaSeleccionada.TextoRespuesta = txbRespuesta.Text;
            lblRespuesta.Visible = true;
            if (AdministradorPreguntas.Instancia.GuardarRespuesta(preguntaSeleccionada))
            {
                panelExitoso.Visible = true;
                panelError.Visible = false;
            }
            else
            {
                panelExitoso.Visible = false;
                panelError.Visible = true;
            }
        }

        protected void AceptarPopUpCancelacion(object sender, EventArgs e)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];
            mpeConfirmarCancelacion.Hide();
            if (AdministradorViajes.Instancia.CancelarViaje(ViajeDetalle))
            {
                popUpConfirmacionCancelacion.MensajePrincipal =
                    "Ya se ha cancelado tu viaje, de tener participantes ellos seran informados";
                popUpConfirmacionCancelacion.TituloPopUp = "Transaccion exitosa";

            }
            else
            {
                popUpConfirmacionCancelacion.MensajePrincipal =
                    "No se ha podido cancelar tu viaje, Lo sentimos.";
                popUpConfirmacionCancelacion.TituloPopUp = "Transaccion fallida";
            }
            popUpConfirmacionCancelacion.MostrarPopUp();
        }

        //Esta funcion solo redirecciona despues de cancelar el viaje
        protected void AceptarPopUpCancelacionRealizada(object sender, EventArgs e)
        {
            Response.Redirect("../Front/Bienvenida.aspx");
        }

        protected void AceptarPopUpSolicitud(object sender, EventArgs eventArgs)
        {
            popUpConfirmacionSolicitud.CerrarPopUp();
        }
        #endregion
    }
}