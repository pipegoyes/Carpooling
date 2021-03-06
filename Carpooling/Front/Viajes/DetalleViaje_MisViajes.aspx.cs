﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities.Aplicacion;
using Entities.Negocio;

namespace Carpooling.Front.Viajes
{
    public partial class DetalleViaje_MisViajes : Page
    {
        public Viaje ViajeDetalle { get; set; }

        public long IdViaje { get; set; }

        public string CiudadOrigen { get; set; }

        public string CiudadDestino { get; set; }

        public Usuario UsuarioConectado { get; set; }

        public int NumeroCalificacionesPendientes { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            this.popUpCalificar.OnContinuarClick += new EventHandler(PopupCalificar_OnContinuarClick);

            string idViajeStr = Request.QueryString["idViajeDetalle"];
            try
            {
                if (idViajeStr == null)
                    throw new Exception("Por favor re-ingrese a la aplicacón, su tiempo de sesiòn ha expirado.");
                UsuarioConectado = (Usuario) Session["usuario"];
                IdViaje = Convert.ToInt64(idViajeStr);
                ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
                Session["ViajeSeleccionado"] = ViajeDetalle;
                if(ViajeDetalle.Estado == Viaje.ViajeEstado.Realizado)
                {
                    btnEditar.Visible = false;
                    btnCancelarViaje.Visible = false;
                }

                PintarDetalleViaje();
                PintarSolicitudes();
                PintarPreguntas();
                PintarCalificaciones();
                CrearHiddenFields();
            }
            catch (Exception ex)
            {
                var error = new ErrorAplicacion {TituloError = ex.Message, DetalleError = ex.StackTrace};
                ((Global) Context.ApplicationInstance).ErrorExcepcion = error;
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
            var hiddenCiudadOrigen = new HtmlInputHidden
                                         {ID = "txbCiudadOrigen", Value = ViajeDetalle.GetCiudadOrigen().Direccion};
            contenedorHiddenFields.Controls.Add(hiddenCiudadOrigen);

            var hiddenCiudadDestino = new HtmlInputHidden
                                          {ID = "txbCiudadDestino", Value = ViajeDetalle.GetCiudadDestino().Direccion};
            contenedorHiddenFields.Controls.Add(hiddenCiudadDestino);

            int[] count = {1};
            foreach (
                HtmlInputHidden hiddenParada in
                    ViajeDetalle.GetParadasSinOrigenDestino().Select(
                        parada => new HtmlInputHidden {ID = "txbParada" + count[0], Value = parada.Direccion}))
            {
                contenedorHiddenFields.Controls.Add(hiddenParada);
                count[0]++;
            }
        }

        private void InicializarPopUpRespuesta()
        {
            panelError.Visible = false;
            panelExitoso.Visible = false;
            txbRespuesta.Text = "";
        }

        //Actualiza la seccion de calificacion
        private void PintarCalificaciones()
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];
            hdfEstadoViaje.Value = ViajeDetalle.Estado.ToString();

            if (ViajeDetalle.Estado != Viaje.ViajeEstado.Realizado)
            {
                tabCalificaciones.Visible = false;
                PanelCalificacionesDetalle.Visible = false;
            }
            else
            {
                List<ItemTablaCalificacion> listaCalificaciones = AdministradorCalificaciones.Instancia.CrearItemCalificacion(ViajeDetalle, UsuarioConectado);
                NumeroCalificacionesPendientes = listaCalificaciones.Count;
                if (NumeroCalificacionesPendientes > 0)
                {
                    tabCalificaciones.InnerText = "Calificaciones (" + NumeroCalificacionesPendientes + ")";
                    dataListCalificaciones.DataSource = listaCalificaciones;
                    dataListCalificaciones.DataBind();
                    lblSinCalificaciones.Visible = false;
                }
                else
                {
                    lblSinCalificaciones.Visible = true;
                    dataListCalificaciones.DataSource = null;
                    dataListCalificaciones.DataBind();
                }
            }
        }

        //Actualiza el listado de las solicitudes (Aprobadas y pendientes) segun el viaje seleccionado
        private void PintarSolicitudes()
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            List<Trayecto> listTrayectosSolicitudesPendientes =
                AdministradorSolicitudes.Instancia.DeterimnarTrayectosConSolicitudesPendientes(
                    ViajeDetalle.TrayectosViaje);
            if (listTrayectosSolicitudesPendientes.Count > 0 && ViajeDetalle.Estado != Viaje.ViajeEstado.Realizado)
            {
                tabSolicitudes.InnerText = "Solicitudes (" + listTrayectosSolicitudesPendientes.Count + ")";
                dataListSolicitudes.DataSource = listTrayectosSolicitudesPendientes;
                dataListSolicitudes.DataBind();
                lblSinSolicitudes.Visible = false;
            }
            else
            {
                lblSinSolicitudes.Visible = true;
                dataListSolicitudes.DataSource = null;
                dataListSolicitudes.DataBind();
            }
                


            List<ItemTablaSolicitud> listaSolicitudesItem =
                AdministradorSolicitudes.Instancia.CreateItemSolicitud(ViajeDetalle);

            List<ItemTablaSolicitud> solicitudesAprobadas =
                listaSolicitudesItem.FindAll(s => s.Estado == Solicitud.SolicitudEstado.Aprobada);
            if (solicitudesAprobadas.Any())
            {
                tabParticipantes.InnerText = "Participantes (" + solicitudesAprobadas.Count + ")";
                dataListParticipantes.DataSource = solicitudesAprobadas;
                dataListParticipantes.DataBind();
                lblSinParticipantes.Visible = false;
            }
            else
                lblSinParticipantes.Visible = true;
        }

        private void PintarPreguntas()
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            if (ViajeDetalle.Preguntas.Count > 0)
            {
                tabPreguntas.InnerText = (ViajeDetalle.Preguntas.Any(p => String.IsNullOrWhiteSpace(p.TextoRespuesta)))
                                             ? "Preguntas (" +
                                               ViajeDetalle.Preguntas.FindAll(
                                                   p => String.IsNullOrWhiteSpace(p.TextoRespuesta)).Count + ")"
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
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            foreach (Solicitud solicitudSeleccionada in ViajeDetalle.TrayectosViaje.Select(
                trayecto => trayecto.ListaSolicitudes.Find(t => t.IdSolicitud == idSolicitud)).Where(
                    solicitudSeleccionada => solicitudSeleccionada != null))
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

        protected void BtnAceptarRechazarSolicitud(object sender, ListViewCommandEventArgs e)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
            if (e.CommandName.ToLower().Equals("aceptarsolicitud"))
            {
                long idSolicitud = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                Solicitud solicitudSeleccionada = BuscarSolicitud(idSolicitud);
                if (AdministradorSolicitudes.Instancia.AceparSolicitud(ViajeDetalle, solicitudSeleccionada))
                {
                    ActualizarViajeDetalle();
                    PintarSolicitudes();
                    PintarDetalleViaje();
                    //upListTrayectos.Update();
                }
                    
            }
            else if (e.CommandName.ToLower().Equals("rechazarsolicitud"))
            {
                long idSolicitud = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                Solicitud solicitudRechazada = BuscarSolicitud(idSolicitud);
                if (AdministradorSolicitudes.Instancia.RechazarSolicitud(solicitudRechazada))
                    PintarSolicitudes();
            }
            //upSolicitudes.Update();
        }

        protected void BtnResponderClick(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("responder"))
            {
                long idPreguntaSeleccionada = long.Parse(((LinkButton) e.CommandSource).CommandArgument);
                Pregunta preguntaSeleccionada = ViajeDetalle.Preguntas.Find(p => p.IdPregunta == idPreguntaSeleccionada);
                Session["preguntaSeleccionada"] = preguntaSeleccionada;
                lblPregunta.Text = preguntaSeleccionada.TextoPregunta;
                InicializarPopUpRespuesta();
                mpeResponder.Show();
            }
        }

        protected void BtnEditarClick(object sender, EventArgs e)
        {
            if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];
            
            if(ViajeDetalle.GetPasajeros().Count > 0)
            {
                popUpEdicionInvalidad.TituloPopUp = "Edición invalida";
                popUpEdicionInvalidad.MensajePrincipal =
                    "No es posible editar un viaje cuando ya existen pasajeros en el.";
                popUpEdicionInvalidad.MostrarPopUp();
            }
            else
                Response.Redirect("../Viajes/EditarViaje.aspx?id=" + ViajeDetalle.IdViaje);            
            
        }

        protected void BtnCancelarPopUpResponder(object sender, EventArgs e)
        {
            mpeResponder.Hide();
        }

        #region Aceptar del popup de un solo boton

        protected void AceptarPopUpResponder(object sender, EventArgs e)
        {
            var preguntaSeleccionada = (Pregunta) Session["preguntaSeleccionada"];
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
            if (ViajeDetalle == null) ViajeDetalle = (Viaje) Session["ViajeSeleccionado"];
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

        protected void AceptarEdicionInvalida(object sender, EventArgs e)
        {
            popUpEdicionInvalidad.CerrarPopUp();
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

        private void ActualizarViajeDetalle()
        {
            string idViajeStr = Request.QueryString["idViajeDetalle"];
            ViajeDetalle = AdministradorViajes.Instancia.VerDetalleViaje(IdViaje);
            Session["ViajeSeleccionado"] = ViajeDetalle;
        }

        protected void dataListCalificaciones_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("calificar"))
            {
                popUpCalificar.TituloPopUp = "Calificar a " + ((Label)e.Item.FindControl("lblParticipanteCalificar")).Text;
                if (ViajeDetalle == null) ViajeDetalle = (Viaje)Session["ViajeSeleccionado"];

                var calificacionActual = new Calificacion() 
                    {
                        IdCalificacion = Convert.ToInt64(((LinkButton)e.Item.FindControl("btnCalificarParticipante")).CommandArgument),
                        IdUsuarioEvaluado = ((HiddenField)e.Item.FindControl("hdfIdEvaluado")).Value,
                        IdUsuarioEvaluador = ((HiddenField)e.Item.FindControl("hdfIdEvaluador")).Value,
                        IdViaje = ViajeDetalle.IdViaje
                    };

                popUpCalificar.CalificacionActual = calificacionActual;
                if (calificacionActual.IdUsuarioEvaluado.Equals(ViajeDetalle.Conductor.IdUsuario))
                    popUpCalificar.MostrarVentana(Rol.Conductor);
                else
                    popUpCalificar.MostrarVentana(Rol.Pasajero);
            }
        }

        protected void PopupCalificar_OnContinuarClick(object sender, EventArgs e)
        {
            string scritpTab;
            if(NumeroCalificacionesPendientes > 0)
                scritpTab = " ActualizarContadorTab('" + tabCalificaciones.ClientID + "', 'Calificaciones (" + NumeroCalificacionesPendientes + ")');";
            else
                scritpTab = " ActualizarContadorTab('" + tabCalificaciones.ClientID + "', 'Calificaciones');";
            //scritpTab += " </script>";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "tab" + ViajeDetalle.IdViaje.ToString(),  scritpTab, true);
            upPanelCalificacionesDetalle.Update();
        }
    }
}