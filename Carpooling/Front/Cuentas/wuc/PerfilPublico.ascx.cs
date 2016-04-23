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
            lblResidencia.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase((usuarioPerfil.ResidenciaUbicacion.NombreCiudad + " (" + usuarioPerfil.ResidenciaUbicacion.NombreDepartamento + ") - " + usuarioPerfil.ResidenciaUbicacion.NombrePais).Trim().ToLower());
            lblGenero.Text = usuarioPerfil.Genero == "H" ? "Hombre" : "Mujer";
            lblFechaNacimiento.Text = usuarioPerfil.FechaNacimiento.ToString("dd/MM/yyyy");
            lblOcupacion.Text = usuarioPerfil.Ocupacion.NombreOcupacion;
            //lblTelefonoMovil.Text = usuarioPerfil.TelefonoMovil;
            //lblTelefonoFijo.Text = usuarioPerfil.TelefonoFijo;
            if (usuarioPerfil.Fumador)
            {
                imgFumador.ImageUrl = "~/Styles/images/fumador.jpg";
                imgFumador.ToolTip = "Es fumador";
            }
            else
                imgFumador.ToolTip = "No es fumador";
            if (usuarioPerfil.VehiculoPropio)
            {
                imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";
                imgVehiculo.ToolTip = "Tiene vehiculo.";
            }
            else
                imgVehiculo.ToolTip = "No tiene vehiculo";

            lblIdUsuario.Text = usuarioPerfil.IdUsuario;
            lblEmail.Text = usuarioPerfil.Email;
            if (usuarioPerfil.Reputacion != null && usuarioPerfil.Reputacion != 0)
            {
                lblReputación.Text = usuarioPerfil.Reputacion.ToString();
                rtgReputación.CurrentRating = (int)usuarioPerfil.Reputacion;
            }
            else
                rtgReputación.CurrentRating = 0;

            lblFechaUltimoIngreso.Text = usuarioPerfil.FechaUltimoIngreso.ToString("HH:mm:ss, dd/MM/yyyy");
            if (usuarioPerfil.Foto != null)
            {
                string rutaImagen = AdministradorCuentas.Instancia.ObtenerImagenCuenta(Server.MapPath("/"), usuarioPerfil.IdUsuario);
                if (string.IsNullOrEmpty(rutaImagen))
                {
                    var imagenCuenta = AdministradorCuentas.Instancia.ObtenerImageFromBinary(usuarioPerfil.Foto);
                    rutaImagen = AdministradorCuentas.Instancia.GuardarImagenCuenta(imagenCuenta, Server.MapPath("/"), usuarioPerfil.IdUsuario);
                }
                imgImagenCuenta.ImageUrl = rutaImagen.Replace(Server.MapPath("/"), "~/") + "?" + DateTime.Today.ToFileTime();
            }
            else
            {
                imgImagenCuenta.ImageUrl = AdministradorCuentas.Instancia.ObtenerImagenDefectoCuenta(usuarioPerfil.Genero) + "?" + DateTime.Today.ToFileTime();
            }

            lblInfoAdicional.Text = usuarioPerfil.InformacionAdicional;
        }

        public void MostrarVentana(string idUsuario)
        {
            usuarioPerfil = AdministradorCuentas.Instancia.ConsultarUsuarioPorId(idUsuario);
            if (usuarioPerfil != null)
                MostrarInfoUsuario();
            uplVentanaModal.Update();
            mpePerfilPublico.Show();
        }
    }
}