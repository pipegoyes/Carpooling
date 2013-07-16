using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using System.Web.Security;

using BusinessLayer;
using BusinessLayer.ServiciosGUI;
using Entities.Negocio;
using Entities.Aplicacion;


namespace Carpooling.Front.Cuentas
{
    public partial class CrearCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarValoresHidden();

            if (!this.IsPostBack)
            {
                //string fileName;
                //fileName = ConfigurationManager.AppSettings["ImagenCuentaHombre"];
                //fileName = Server.MapPath(fileName.Replace("~", ""));
                //Session["imagenUsuario"] = fileName;
                //imgImagenCuenta.ImageUrl = Session["imagenUsuario"].ToString().Replace(Server.MapPath("/"), "~/") + "?" + DateTime.Today.ToFileTime();
                CargarDdlOcupacion();
            }
        }

        private void CargarValoresHidden()
        {
            //hfdImagePathHombre.Value = ConfigurationManager.AppSettings["ImagenCuentaHombre"];
            //hfdImagePathMujer.Value = ConfigurationManager.AppSettings["ImagenCuentaMujer"];
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

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            try
            {
                var usuario = new Usuario
                {
                    IdUsuario = txbIdUsuario.Text.ToLower(),
                    Nombre = txtNombres.Text,
                    Apellido = txtApellidos.Text,
                    Contrasenia = AdministradorCuentas.Instancia.EncriptarContrasenia(txtContrasena.Text.Trim()),
                    FechaNacimiento = new DateTime(Convert.ToInt32(ddlAnioNacimiento.SelectedValue), Convert.ToInt32(ddlMesNacimiento.SelectedValue), Convert.ToInt32(hfDiaNacimiento.Value)),
                    FechaUltimoIngreso = DateTime.Now,
                    ResidenciaUbicacion =
                        new UbicacionGeografica
                        {
                            IdCiudad = Convert.ToInt32(ddlCiudad.SelectedValue),
                            NombreCiudad = ddlCiudad.Text,
                            IdDepartamento = Convert.ToInt32(ddlDepartamento.SelectedValue),
                            NombreDepartamento = ddlDepartamento.Text,
                            IdPais = Convert.ToInt32(ddlPais.SelectedValue),
                            NombrePais = ddlPais.Text
                        },
                    Email = txtCorreoElectronico.Text,
                    Genero = rblGenero.SelectedValue,
                    Ocupacion =
                        new Ocupacion
                        {
                            IdOcupacion = Convert.ToInt32(ddlOcupacion.SelectedValue),
                            NombreOcupacion = ddlOcupacion.Text
                        },
                    TelefonoFijo = txtTelefonoFijo.Text,
                    TelefonoMovil = txtTelefonoMovil.Text,
                    Fumador = chkFumador.Checked,
                    VehiculoPropio = chkVehiculo.Checked,


                    InformacionAdicional = txbInfoAdicional.Text.Trim(),
                    Foto = null,
                    Reputacion = null

                };

                //string rutaImagenCuentaActual = Session["imagenUsuario"].ToString();
                //string rutaImagenCuentaNueva;
                //if (Request.Form["hfdImagePath"].LastIndexOf('?') != -1)
                //    rutaImagenCuentaNueva = Server.MapPath(Request.Form["hfdImagePath"].Substring(0, Request.Form["hfdImagePath"].LastIndexOf('?')));
                //else
                //    rutaImagenCuentaNueva = Server.MapPath(Request.Form["hfdImagePath"]);
                //bool imagenesIguales;
                //string rutaImagenMostrar;
                //byte[] imagenNueva = AdministradorCuentas.Instancia.ActualizarImagenCuenta(Server.MapPath("/"), rutaImagenCuentaActual, rutaImagenCuentaNueva, out imagenesIguales, out rutaImagenMostrar);
                //if (!imagenesIguales)
                //    usuario.Foto = imagenNueva;

                //crea el usuario en la base de datos
                AdministradorCuentas.Instancia.CrearCuenta(usuario);

                //inicia sesion con el usuario
                Session["usuario"] = usuario;
                AdministradorCuentas.Instancia.EliminarImagenTemporal(Server.MapPath("/"), usuario.IdUsuario);

                string fileName;
                if (usuario.Foto != null)
                {
                    var imagenCuenta = AdministradorCuentas.Instancia.ObtenerImageFromBinary(usuario.Foto);
                    fileName = AdministradorCuentas.Instancia.GuardarImagenCuenta(imagenCuenta, Server.MapPath("/"), usuario.IdUsuario);
                }
                else
                {
                    fileName = usuario.Genero == "H" ? ConfigurationManager.AppSettings["ImagenCuentaHombre"] : ConfigurationManager.AppSettings["ImagenCuentaMujer"];
                    fileName = Server.MapPath(fileName.Replace("~", ""));
                }
                Session["imagenUsuario"] = fileName;

                string nombreMostrarUsuario = usuario.ObtenerNombreApellidos() + " (" + usuario.IdUsuario + ")";
                FormsAuthentication.RedirectFromLoginPage(nombreMostrarUsuario, false);
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