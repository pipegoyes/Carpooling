using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using BusinessLayer.ServiciosGUI;
using Entities.Negocio;

namespace Carpooling.Front.Cuentas
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        Usuario usuarioApp;
        string nombreMostrarUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (usuarioApp == null)
                usuarioApp = (Usuario)Session["usuario"];

            if (!this.IsPostBack)
            {
                CargarDdlOcupacion();
                MostrarInfoUsuario();
            }
        }

        protected void CargarDdlOcupacion()
        {
            //Carga el DDL de ocupaciones
            ddlOcupacion.DataSource = FuenteDatosControl.Instancia.ObtenerOcupaciones();
            ddlOcupacion.DataValueField = "Valor";
            ddlOcupacion.DataTextField = "Dato";
            ddlOcupacion.DataBind();
            ddlOcupacion.Items.Insert(0, new ListItem { Value = "-1", Text = "--- Seleccione una ---", Selected = true });
        }

        protected void MostrarInfoUsuario()
        {
            nombreMostrarUsuario = usuarioApp.Nombre + " " + usuarioApp.Apellido;
            lblNombresApellidos.Text = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower());

            lblNombreCuenta.Text = usuarioApp.IdUsuario;

            txbNombres.Text = usuarioApp.Nombre;

            txbApellidos.Text = usuarioApp.Apellido;

            cddlPais.SelectedValue = usuarioApp.ResidenciaUbicacion.IdPais.ToString();

            cddlDepartamento.SelectedValue = usuarioApp.ResidenciaUbicacion.IdDepartamento.ToString();

            cddlCiudad.SelectedValue = usuarioApp.ResidenciaUbicacion.IdCiudad.ToString();

            rblGenero.SelectedValue = usuarioApp.Genero;

            ddlAnioNacimiento.SelectedValue = usuarioApp.FechaNacimiento.Year.ToString();

            ddlMesNacimiento.SelectedValue = usuarioApp.FechaNacimiento.Month.ToString();

            CargarDdlDiaNacimiento();
            ddlDiaNacimiento.SelectedValue = usuarioApp.FechaNacimiento.Day.ToString();

            hfDiaNacimiento.Value = usuarioApp.FechaNacimiento.Day.ToString();

            ddlOcupacion.SelectedValue = usuarioApp.Ocupacion.IdOcupacion.ToString();

            txbTelefonoMovil.Text = usuarioApp.TelefonoMovil;

            txbTelefonoFijo.Text = usuarioApp.TelefonoFijo;

            if (usuarioApp.Fumador)
                imgFumador.ImageUrl = "~/Styles/images/fumador.jpg";

            chkFumador.Checked = usuarioApp.Fumador;

            if (usuarioApp.VehiculoPropio)
                imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";

            chkVehiculo.Checked = usuarioApp.VehiculoPropio;

            txbIdUsuario.Text = usuarioApp.IdUsuario;

            txbEmail.Text = usuarioApp.Email;

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

            txbInfoAdicional.Text = usuarioApp.InformacionAdicional;
        }

        protected void CargarDdlDiaNacimiento()
        {
            if (ddlAnioNacimiento.SelectedValue != "-1" && ddlMesNacimiento.SelectedValue != "-1")
            {
                int anio = Int32.Parse(ddlAnioNacimiento.SelectedValue);
                int mes = Int32.Parse(ddlMesNacimiento.SelectedValue);

                ddlDiaNacimiento.DataSource = FuenteDatosControl.Instancia.ObtenerDiasMes(mes, anio);
                ddlDiaNacimiento.DataBind();
                ddlDiaNacimiento.Items.Insert(0, new ListItem { Value = "-1", Text = "Día", Selected = true });
                ddlDiaNacimiento.Enabled = true;
            }
            else
            {
                ddlDiaNacimiento.Items.Clear();
                ddlDiaNacimiento.Items.Insert(0, new ListItem { Value = "-1", Text = "Día", Selected = true });
                ddlDiaNacimiento.Enabled = false;
            }
        }
    }
}