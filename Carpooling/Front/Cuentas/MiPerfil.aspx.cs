﻿using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Cuentas
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        Usuario usuarioApp;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(usuarioApp == null)
                usuarioApp = (Usuario)Session["usuario"];

            if(!this.IsPostBack)
                MostrarInfoUsuario();
        }

        private void MostrarInfoUsuario()
        {          
            lblNombresApellidos.Text = usuarioApp.ObtenerNombreApellidos();
            lblNombres.Text = usuarioApp.Nombre.Trim();
            lblApellidos.Text = usuarioApp.Apellido.Trim();
            lblResidencia.Text = usuarioApp.ResidenciaUbicacion.NombreCiudad + " (" + usuarioApp.ResidenciaUbicacion.NombreDepartamento + ") - " + usuarioApp.ResidenciaUbicacion.NombrePais;
            lblGenero.Text = usuarioApp.Genero == "H" ? "Hombre" : "Mujer";
            lblFechaNacimiento.Text = usuarioApp.FechaNacimiento.ToString("dd/MM/yyyy");
            lblOcupacion.Text = usuarioApp.Ocupacion.NombreOcupacion;
            lblTelefonoMovil.Text = usuarioApp.TelefonoMovil;
            lblTelefonoFijo.Text = usuarioApp.TelefonoFijo;
            chkFumador.Checked = usuarioApp.Fumador; 
            if (usuarioApp.Fumador)
                imgFumador.ImageUrl = "~/Styles/images/fumador.jpg";
            chkVehiculo.Checked = usuarioApp.VehiculoPropio; 
            if (usuarioApp.VehiculoPropio)
                imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";
            lblIdUsuario.Text = usuarioApp.IdUsuario;
            lblEmail.Text = usuarioApp.Email;
            if (usuarioApp.Reputacion != null && usuarioApp.Reputacion != 0)
            {
                lblReputación.Text = usuarioApp.Reputacion.ToString();
                rtgReputación.CurrentRating = (int)usuarioApp.Reputacion;
            }
            else
                rtgReputación.CurrentRating = 0;
            lblFechaUltimoIngreso.Text = usuarioApp.FechaUltimoIngreso.ToString("HH:mm:ss, dd/MM/yyyy");
            imgImagenCuenta.ImageUrl = Session["imagenUsuario"].ToString().Replace(Server.MapPath("/"), "~/") + "?" + DateTime.Today.ToFileTime();
            lblInfoAdicional.Text = usuarioApp.InformacionAdicional;
        }

        protected void btnEditarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Front/Cuentas/EditarPerfil.aspx",false);
        }

        protected void btnCambiarContrasenia_Click(object sender, EventArgs e)
        {
            ucCambioContrasenia.MostrarVentana();
        }

        protected void btnDesactivarCuenta_Click(object sender, EventArgs e)
        {
            ucDesactivarCuenta.MostrarVentana();
        }

    }
}