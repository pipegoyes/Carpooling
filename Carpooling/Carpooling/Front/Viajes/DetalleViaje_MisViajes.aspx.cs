using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BusinessLayer;
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
            txtFechaViaje.Text = ViajeDetalle.FechaHoraPartida.ToString("MM/dd/yyyy") + " (mm/dd/yyyy)";
            txtHora.Text = String.Format("{0:HH:mm}", ViajeDetalle.FechaHoraPartida) + " (24h)";
            txtTarifa.Text = "$" + ViajeDetalle.AporteEconomico + " COP";

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

        protected void BtnAceptarSolicitud(object sender, DataListCommandEventArgs e)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
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
                var idPreguntaSeleccionada = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                var preguntaSeleccionada =  ViajeDetalle.Preguntas.Find(p => p.IdPregunta == idPreguntaSeleccionada);
                lblPregunta.Text = preguntaSeleccionada.TextoPregunta;
                mpeResponder.Show();
            }
        }

        protected void BtnOkPopUpConfirmacion(object sender, DataListCommandEventArgs e)    
        {
            popUpConfirmation.CerrarPopUp();
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
                    dataListSolicitudes.DataSource = solitudesPendientes;
                    dataListSolicitudes.DataBind();
                    lblSinSolicitudes.Visible = false;   
                }
                var solicitudesAprobadas =
                    listaSolicitudesItem.FindAll(s => s.Estado == Solicitud.SolicitudEstado.Aprobada);
                if(solicitudesAprobadas.Any())
                {
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
            popUpConfirmation.MensajePrincipal = mensaje;
            popUpConfirmation.TransaccionExitosa = transaccionExitosa;
            popUpConfirmation.TituloPopUp = transaccionExitosa ? "Transacción Exitosa" : "Transacción fallida";
            popUpConfirmation.MostrarPopUp();
        }
    }
}