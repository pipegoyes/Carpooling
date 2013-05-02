using System;
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
        string nombreMostrarUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(usuarioApp == null)
                usuarioApp = (Usuario)Session["usuario"];

            if(!this.IsPostBack)
                MostrarInfoUsuario();
        }

        private void MostrarInfoUsuario()
        {
            nombreMostrarUsuario = usuarioApp.Nombre + " " + usuarioApp.Apellido;
            lblNombresApellidos.Text = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower());
            lblNombres.Text = usuarioApp.Nombre.Trim();
            lblApellidos.Text = usuarioApp.Apellido.Trim();
            lblResidencia.Text = usuarioApp.ResidenciaUbicacion.NombreCiudad + " (" + usuarioApp.ResidenciaUbicacion.NombreDepartamento + ") - " + usuarioApp.ResidenciaUbicacion.NombrePais;
            lblGenero.Text = usuarioApp.Genero == "H" ? "Hombre" : "Mujer";
            lblFechaNacimiento.Text = usuarioApp.FechaNacimiento.ToString("dd/MM/yyyy");
            lblOcupacion.Text = usuarioApp.Ocupacion.NombreOcupacion;
            lblTelefonoMovil.Text = usuarioApp.TelefonoMovil;
            lblTelefonoFijo.Text = usuarioApp.TelefonoFijo;
            if (usuarioApp.Fumador)
                imgFumador.ImageUrl = "~/Styles/images/fumador.jpg";
            if (usuarioApp.VehiculoPropio)
                imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";
            lblIdUsuario.Text = usuarioApp.IdUsuario;
            lblEmail.Text = usuarioApp.Email;
            if (usuarioApp.Reputacion != null && usuarioApp.Reputacion != 0)
            {
                lblReputación.Text = usuarioApp.Reputacion.ToString();
                ddlReputación.SelectedValue = Math.Round(usuarioApp.Reputacion.Value).ToString();
            }
            lblFechaUltimoIngreso.Text = usuarioApp.FechaUltimoIngreso.ToString("dd/MM/yyyy");
            if (usuarioApp.Foto != null)
            {
                string cacheImagenFolder = ConfigurationManager.AppSettings["CacheImagenFolder"];
                string fileName = Session["imagenUsuario"].ToString();
                imgImagenCuenta.ImageUrl = "~/" + cacheImagenFolder + "/" + fileName;
            }
            else 
            {
                imgImagenCuenta.ImageUrl = usuarioApp.Genero == "H" ? "~/Styles/images/imgFotoPerfilHombre.jpg" : "~/Styles/images/imgFotoPerfilMujer.jpg";
            }
            lblInfoAdicional.Text = usuarioApp.InformacionAdicional;
        }

        protected void btnEditarPerfil_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Front/Cuentas/EditarPerfil.aspx");
        }
    }
}