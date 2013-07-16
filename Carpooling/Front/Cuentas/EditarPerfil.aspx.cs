using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using BusinessLayer;
using BusinessLayer.ServiciosGUI;
using Entities.Negocio;
using Entities.Aplicacion;

namespace Carpooling.Front.Cuentas
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        Usuario usuarioApp;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (usuarioApp == null)
                    usuarioApp = (Usuario)Session["usuario"];

                CargarValoresHidden();

                if (!this.IsPostBack)
                {
                    CargarDdlOcupacion();                    
                    MostrarInfoUsuario();
                }
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion{TituloError = ex.Message, DetalleError = ex.StackTrace};
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        private void CargarValoresHidden()
        {
            hfdImagePathHombre.Value = ConfigurationManager.AppSettings["ImagenCuentaHombre"];
            hfdImagePathMujer.Value = ConfigurationManager.AppSettings["ImagenCuentaMujer"];
            hfdPathImagenFumador.Value = ConfigurationManager.AppSettings["ImagenFumador"];
            hfdPathImagenNoFumador.Value = ConfigurationManager.AppSettings["ImagenNoFumador"];
            hfdPathImagenVehiculo.Value = ConfigurationManager.AppSettings["ImagenVehiculo"];
            hfdPathImagenNoVehiculo.Value = ConfigurationManager.AppSettings["ImagenNoVehiculo"];
        }

        protected void CargarDdlOcupacion()
        {
            try
            {
                //Carga el DDL de ocupaciones
                ddlOcupacion.DataSource = FuenteDatosControl.Instancia.ObtenerOcupaciones();
                ddlOcupacion.DataValueField = "Valor";
                ddlOcupacion.DataTextField = "Dato";
                ddlOcupacion.DataBind();
                ddlOcupacion.Items.Insert(0, new ListItem { Value = "-1", Text = "--- Seleccione una ---", Selected = true });
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        protected void MostrarInfoUsuario()
        {
            try
            {
                lblNombresApellidos.Text = usuarioApp.ObtenerNombreApellidos().ToUpper();
                lblNombreCuenta.Text = "(" + usuarioApp.IdUsuario + ")";
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
                hfdFumador.Value = usuarioApp.Fumador ? "1" : "0";
                if (usuarioApp.VehiculoPropio)
                    imgVehiculo.ImageUrl = "~/Styles/images/vehiculo.png";
                chkVehiculo.Checked = usuarioApp.VehiculoPropio;
                hfdVehiculo.Value = usuarioApp.VehiculoPropio ? "1" : "0";
                txbIdUsuario.Text = usuarioApp.IdUsuario;
                txbEmail.Text = usuarioApp.Email;
                imgImagenCuenta.ImageUrl = Session["imagenUsuario"].ToString().Replace(Server.MapPath("/"), "~/") + "?" + DateTime.Today.ToFileTime();
                txbInfoAdicional.Text = usuarioApp.InformacionAdicional;
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        protected void CargarDdlDiaNacimiento()
        {
            try
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
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            try
            {
                //valida la modificacion de la contraseña
                if (!string.IsNullOrEmpty(txbContraseniaActual.Text) || !string.IsNullOrEmpty(txbNuevaContrasenia.Text) || !string.IsNullOrEmpty(txbReNuevaContrasenia.Text))
                {
                    if (txbContraseniaActual.Text.Trim() != AdministradorCuentas.Instancia.DesencriptarContrasenia(usuarioApp.Contrasenia))
                    {
                        hfMensajes.Value = "La contraseña actual es incorrecta."; //TODO: popup de serveridor
                        return;
                    }
                    usuarioApp.Contrasenia = AdministradorCuentas.Instancia.EncriptarContrasenia(txbNuevaContrasenia.Text.Trim());
                }

                usuarioApp.Apellido = txbApellidos.Text.Trim();
                usuarioApp.Email = txbEmail.Text.Trim();
                usuarioApp.FechaNacimiento = new DateTime(Convert.ToInt32(ddlAnioNacimiento.SelectedValue), Convert.ToInt32(ddlMesNacimiento.SelectedValue), Convert.ToInt32(hfDiaNacimiento.Value));

                string rutaImagenCuentaActual = Session["imagenUsuario"].ToString();
                string rutaImagenCuentaNueva;
                if (Request.Form["hfdImagePath"].LastIndexOf('?') != -1)
                    rutaImagenCuentaNueva = Server.MapPath(Request.Form["hfdImagePath"].Substring(0, Request.Form["hfdImagePath"].LastIndexOf('?')));
                else
                    rutaImagenCuentaNueva = Server.MapPath(Request.Form["hfdImagePath"]);
                bool imagenesIguales;
                string rutaImagenMostrar;
                byte[] imagenNueva = AdministradorCuentas.Instancia.ActualizarImagenCuenta(Server.MapPath("/"), rutaImagenCuentaActual, rutaImagenCuentaNueva, out imagenesIguales, out rutaImagenMostrar);
                if (!imagenesIguales)
                    usuarioApp.Foto = imagenNueva;

                usuarioApp.Fumador = chkFumador.Checked;
                usuarioApp.Genero = rblGenero.SelectedValue;
                usuarioApp.InformacionAdicional = txbInfoAdicional.Text.Trim();
                usuarioApp.Nombre = txbNombres.Text.Trim();
                usuarioApp.Ocupacion = new Ocupacion { IdOcupacion = Convert.ToInt32(ddlOcupacion.SelectedValue), NombreOcupacion = ddlOcupacion.SelectedItem.Text };
                usuarioApp.TelefonoFijo = txbTelefonoFijo.Text.Trim();
                usuarioApp.TelefonoMovil = txbTelefonoMovil.Text.Trim();
                usuarioApp.VehiculoPropio = chkVehiculo.Checked;        
                usuarioApp.ResidenciaUbicacion = new UbicacionGeografica
                {
                    IdCiudad = Convert.ToInt32(ddlCiudad.SelectedValue),
                    NombreCiudad = ddlCiudad.SelectedItem.Text,
                    IdDepartamento = Convert.ToInt32(ddlDepartamento.SelectedValue),
                    NombreDepartamento = ddlDepartamento.SelectedItem.Text,
                    IdPais = Convert.ToInt32(ddlPais.SelectedValue),
                    NombrePais = ddlPais.SelectedItem.Text
                };

                if (AdministradorCuentas.Instancia.ModificarCuenta(usuarioApp))
                {
                    Session["usuario"] = usuarioApp;
                    Session["imagenUsuario"] = rutaImagenMostrar;
                    AdministradorCuentas.Instancia.EliminarImagenTemporal(Server.MapPath("/"), usuarioApp.IdUsuario);
                    Response.Redirect("~/Front/Cuentas/MiPerfil.aspx",false);
                }
                else
                {
                    hfMensajes.Value = "La contraseña actual es incorrecta.";
                }
            }
            catch (Exception ex)
            {
                ErrorAplicacion error = new ErrorAplicacion { TituloError = ex.Message, DetalleError = ex.StackTrace };
                ((Global)this.Context.ApplicationInstance).ErrorExcepcion = error;
                Response.Redirect("~/Front/Error.aspx");
            }
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.CascadingDropDownNameValue[] ObtenerPaisesDdl(string knownCategoryValues, string category)
        {
            return FuenteDatosControl.Instancia.ObtenerPaises().Select(item => new AjaxControlToolkit.CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.CascadingDropDownNameValue[] ObtenerDepartamentosDdl(string knownCategoryValues, string category)
        {
            var keys = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerDepartamentos(Int32.Parse(keys["pais"])).Select(item => new AjaxControlToolkit.CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.CascadingDropDownNameValue[] ObtenerCiudadesDdl(string knownCategoryValues, string category)
        {
            var keys = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerCiudades(Int32.Parse(keys["departamento"])).Select(item => new AjaxControlToolkit.CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static List<int> ObtenerDiasDdl(string pMes, string pAnio)
        {
            return FuenteDatosControl.Instancia.ObtenerDiasMes(Int32.Parse(pMes), Int32.Parse(pAnio));
        }
    }
}