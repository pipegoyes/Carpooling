using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Threading;
using AjaxControlToolkit;

using BusinessLayer;
using Entities.Negocio;

namespace Carpooling.Front.UserControls
{
    public partial class PopupCalificarParticipante : System.Web.UI.UserControl
    {
        public EventHandler OnContinuarClick;

        private bool? CalificacionExitosa 
        { 
            get
            {
                if(ViewState["CalificacionExitosa"] != null)
                    return (bool)ViewState["CalificacionExitosa"];
                return null;
            }
            set
            {
                ViewState["CalificacionExitosa"] = value;
            }
        }

        public string TituloPopUp
        {
            set
            {
                lblTituloVentana.Text = value;
            }
        }

        private Rol RolEvaluado 
        {
            get
            {
                return (Rol)ViewState["PopupCalificarParticipanteRolEvaluado"];
            }
            set
            {
                ViewState["PopupCalificarParticipanteRolEvaluado"] = value;
            }
        }

        public Calificacion CalificacionActual 
        {
            get
            {
                return (Calificacion)Session["PopupCalificarParticipanteCalificacionActual"]; ;
            }
            set
            {
                Session["PopupCalificarParticipanteCalificacionActual"] = value; ;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MostrarVentana(Rol pRolCalificado)
        {
            panelError.Visible = false;
            panelExitoso.Visible = false;
            panelBotonesPrincipales.Visible = true;            
            panelBotonesRespuesta.Visible = false;
            ReiniciarRating();
            mpeCalificarParticipante.Show();

            RolEvaluado = pRolCalificado;
            if (pRolCalificado == Rol.Conductor)
            {
                panelCalificarConductor.Visible = true;
                panelCalificarPasajero.Visible = false;
            }
            else
            {
                panelCalificarConductor.Visible = false;
                panelCalificarPasajero.Visible = true;
            }
        }

        private void ReiniciarRating()
        {
            rtgPuntualidadConductor.CurrentRating = 0;
            rtgComportamientoConductor.CurrentRating= 0;
            rtgInformacionConductor.CurrentRating= 0;
            rtgVehiculoConductor.CurrentRating= 0;
            rtgConduccionConductor.CurrentRating = 0;

            rtgPuntualidadConductor.CurrentRating = 0;
            rtgComportamientoConductor.CurrentRating = 0;
            rtgInformacionConductor.CurrentRating = 0;
        }

        protected void btnAceptarPopUp_Click(object sender, EventArgs e)
        {
            if (RolEvaluado == Rol.Conductor)
            {
                int puntualidad = rtgPuntualidadConductor.CurrentRating;
                int comportamiento = rtgComportamientoConductor.CurrentRating;
                int informacion = rtgInformacionConductor.CurrentRating;
                int vehiculo = rtgVehiculoConductor.CurrentRating;
                int conduccion = rtgConduccionConductor.CurrentRating;
                List<int> calificaciones = new List<int>() { puntualidad, comportamiento, informacion, vehiculo, conduccion };

                CalificacionActual.Puntaje = AdministradorCalificaciones.Instancia.PromedioCalificacion(calificaciones);
                //todo asignar comentario desde la interfaz
                CalificacionActual.FechaRealizacion = DateTime.Now;
                CalificacionExitosa = AdministradorCalificaciones.Instancia.RegistrarCalificacion(CalificacionActual, ((Carpooling.Front.Viajes.DetalleViaje_MisViajes)this.Page).ViajeDetalle.Conductor);
                if (CalificacionExitosa.Value)
                {
                    //todo: mostrar el mensaje de error o existo y el panel de botones de confirmar
                    panelBotonesPrincipales.Visible = false;
                    panelBotonesRespuesta.Visible = true;
                    panelExitoso.Visible = true;
                    panelError.Visible = false;
                }
                else
                {
                    panelBotonesPrincipales.Visible = false;
                    panelBotonesRespuesta.Visible = true;
                    panelExitoso.Visible = false;
                    panelError.Visible = true;
                }
            }
            else
            {
                int puntualidad = rtgPuntualidadConductor.CurrentRating;
                int comportamiento = rtgComportamientoConductor.CurrentRating;
                int informacion = rtgInformacionConductor.CurrentRating;
                List<int> calificaciones = new List<int>() { puntualidad, comportamiento, informacion };

                CalificacionActual.Puntaje = AdministradorCalificaciones.Instancia.PromedioCalificacion(calificaciones);
                //todo asignar comentario desde la interfaz
                CalificacionActual.FechaRealizacion = DateTime.Now;
                CalificacionExitosa = AdministradorCalificaciones.Instancia.RegistrarCalificacion(CalificacionActual, ((Carpooling.Front.Viajes.DetalleViaje_MisViajes)this.Page).ViajeDetalle.Conductor);
                if (CalificacionExitosa.Value)
                {
                    //todo: mostrar el mensaje de error o existo y el panel de botones de confirmar
                    panelBotonesPrincipales.Visible = false;
                    panelBotonesRespuesta.Visible = true;
                    panelExitoso.Visible = true;
                    panelError.Visible = false;
                }
                else
                {
                    panelBotonesPrincipales.Visible = false;
                    panelBotonesRespuesta.Visible = true;
                    panelExitoso.Visible = false;
                    panelError.Visible = true;
                }
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            mpeCalificarParticipante.Hide();
            if(CalificacionExitosa.Value)
                if (OnContinuarClick != null)
                    OnContinuarClick(this, e);
        }
    }
}