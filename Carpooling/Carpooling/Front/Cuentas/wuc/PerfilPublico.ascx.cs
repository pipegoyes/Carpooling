using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Negocio;
using BusinessLayer;

namespace Carpooling.Front.Cuentas.wuc
{
    public partial class PerfilPublico : System.Web.UI.UserControl
    {
        Usuario usuarioPerfil;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void MostrarInfoUsuario()
        {
            lblTituloVentana.Text = "Perfil de " + usuarioPerfil.ObtenerNombreApellidos();
            lblNombresApellidos.Text = usuarioPerfil.ObtenerNombreApellidos();
            lblResidencia.Text = usuarioPerfil.ResidenciaUbicacion.NombreCiudad + " (" + usuarioPerfil.ResidenciaUbicacion.NombreDepartamento + ") - " + usuarioPerfil.ResidenciaUbicacion.NombrePais;
            lblGenero.Text = usuarioPerfil.Genero == "H" ? "Hombre" : "Mujer";
            lblFechaNacimiento.Text = usuarioPerfil.FechaNacimiento.ToString("dd/MM/yyyy");
            lblOcupacion.Text = usuarioPerfil.Ocupacion.NombreOcupacion;
            lblTelefonoMovil.Text = usuarioPerfil.TelefonoMovil;
            lblTelefonoFijo.Text = usuarioPerfil.TelefonoFijo;
            if (usuarioPerfil.Fumador)
                imgFumador.ImageUrl = "~/Styles/images/fumador.jpg";
            if (usuarioPerfil.VehiculoPropio)
                imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";
            lblIdUsuario.Text = usuarioPerfil.IdUsuario;
            lblEmail.Text = usuarioPerfil.Email;
            if (usuarioPerfil.Reputacion != null && usuarioPerfil.Reputacion != 0)
            {
                lblReputación.Text = usuarioPerfil.Reputacion.ToString();
                //ddlReputación.SelectedValue = Math.Round(usuarioPerfil.Reputacion.Value).ToString();
            }
            lblFechaUltimoIngreso.Text = usuarioPerfil.FechaUltimoIngreso.ToString("HH:mm:ss, dd/MM/yyyy");
            imgImagenCuenta.ImageUrl = Session["imagenUsuario"].ToString().Replace(Server.MapPath("/"), "~/") + "?" + DateTime.Today.ToFileTime();
            lblInfoAdicional.Text = usuarioPerfil.InformacionAdicional;
        }

        public void MostrarVentana(string idUsuario)
        {
            usuarioPerfil = AdministradorCuentas.Instancia.ConsultarUsuarioPorId(idUsuario);
            if (usuarioPerfil != null)
                MostrarInfoUsuario();
            mpePerfilPublico.Show();
        }
    }
}