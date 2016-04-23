using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BusinessLayer;
using BusinessLayer.ServiciosGUI;
using Entities.Negocio;
using Entities.Aplicacion;


namespace Carpooling.Front.Cuentas
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        private string m_imagenUsuarioPath; 
  
        protected void Page_Load(object sender, EventArgs e)
        {                       
            //Carga inicial de la pagina
            if(!this.IsPostBack)
            {
                CargarDdlOcupacion();
            }

            //recupera la ruta del la imagen
            var hfdImagePathValue = Request.Form["hfdImagePath"];
            if (!String.IsNullOrEmpty(hfdImagePathValue))
                m_imagenUsuarioPath = hfdImagePathValue;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(3000);
            //var a = ddl.InnerText;

            try
            {
                var usuario = new Usuario
                {
                    IdUsuario = txtNombreUsuario.Text.ToLower(),
                    Nombre = txtNombres.Text,
                    Apellido = txtApellidos.Text,
                    Contrasenia = AdministradorCuentas.Instancia.EncriptarContrasenia(txtContrasena.Text.Trim()),
                    FechaNacimiento = new DateTime(Convert.ToInt32(ddlAnioNacimiento.SelectedValue), Convert.ToInt32(ddlMesNacimiento.SelectedValue), Convert.ToInt32(Request.Form["hfDiaNacimiento"])), //DateTime.Parse(txtFechaNacimiento.Text),
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
                    Genero = rblstGenero.SelectedValue, 
                    Ocupacion = 
                        new Ocupacion 
                        {
                            IdOcupacion = Convert.ToInt32(ddlOcupacion.SelectedValue),
                            NombreOcupacion = ddlOcupacion.Text
                        },
                    TelefonoFijo = txtTelefonoFijo.Text,
                    TelefonoMovil = txtTelefonoMovil.Text,
                    Fumador = chkFumador.Checked,
                    VehiculoPropio = chkVehiculoPropio.Checked,
                    Foto = AdministradorCuentas.Instancia.ObtenerBinaryFromImagen(Server.MapPath("/" + m_imagenUsuarioPath)),
                    InformacionAdicional = txtMasInformacion.Text,
                    Reputacion = null
                    
                };

                AdministradorCuentas.Instancia.CrearCuenta(usuario);                
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "cssWij" + Guid.NewGuid().ToString(), "AplicarCCS();", true);
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static CascadingDropDownNameValue[] ObtenerPaisesDdl(string knownCategoryValues, string category)
        {
            return FuenteDatosControl.Instancia.ObtenerPaises().Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static CascadingDropDownNameValue[] ObtenerDepartamentosDdl(string knownCategoryValues, string category)
        {
            var keys = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerDepartamentos(Int32.Parse(keys["pais"])).Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static CascadingDropDownNameValue[] ObtenerCiudadesDdl(string knownCategoryValues, string category)
        {
            var keys = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerCiudades(Int32.Parse(keys["departamento"])).Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        protected void CargarDdlOcupacion()
        {
            //Carga el DDL de ocupaciones
            ddlOcupacion.DataSource = FuenteDatosControl.Instancia.ObtenerOcupaciones();
            ddlOcupacion.DataValueField = "Valor";
            ddlOcupacion.DataTextField = "Dato";
            ddlOcupacion.DataBind();
            ddlOcupacion.Items.Insert(0, new ListItem {Value="-1", Text="--- Seleccione una ---", Selected=true});
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static List<int> ObtenerDiasDdl(string pMes, string pAnio)
        {
            return FuenteDatosControl.Instancia.ObtenerDiasMes(Int32.Parse(pMes), Int32.Parse(pAnio));
        }

        //protected void CargarDdlDias(int pMes, int pAnio)
        //{
        //    ddlDiaNacimiento.DataSource = FuenteDatosControl.Instancia.ObtenerDiasMes(pMes, pAnio) ;
        //    ddlDiaNacimiento.DataBind();
        //    ddlDiaNacimiento.Items.Insert(0, new ListItem { Value = "-1", Text = "Día", Selected = true });
        //    ddlDiaNacimiento.Enabled = true;
        //}
    }
}