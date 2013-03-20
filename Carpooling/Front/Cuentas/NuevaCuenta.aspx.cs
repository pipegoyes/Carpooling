using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BusinessLayer.ServiciosCuenta;
using BusinessLayer.ServiciosGUI;
using Entities.Negocio;
using Entities.Aplicacion;


namespace Carpooling.Front.Cuentas
{
    public partial class NuevaCuenta : System.Web.UI.Page
    {
        private string m_imagenUsuarioPath; 
  
        protected void Page_Load(object sender, EventArgs e)
        {                       
            //recupera la ruta del la imagen
            var hfdImagePathValue = Request.Form["hfdImagePath"];
            if (!String.IsNullOrEmpty(hfdImagePathValue))
                m_imagenUsuarioPath = hfdImagePathValue;
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnAtras1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnSiguiente1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnAtras2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            try
            {
                var usuario = new Usuario
                                       {
                                           IdUsuario = txtNombreUsuario.Text,
                                           Nombres = txtNombres.Text,
                                           Apellidos = txtApellidos.Text,
                                           Contrasenia = txtContrasena.Text,
                                           FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text),
                                           CiudadResidencia = Int32.Parse(ddlCiudad.SelectedValue),
                                           Email = txtCorreoElectronico.Text,
                                           Sexo = rbtHombre.Checked ? "H" : "F",
                                           Ocupacion = Int32.Parse(ddlOcupacion.SelectedValue),
                                           TelefonoFijo = txtTelefonoFijo.Text,
                                           TelefonoMovil = txtTelefonoMovil.Text,
                                           Fumador = chkFumador.Checked,
                                           VehiculoPropio = chkVehiculoPropio.Checked,
                                           Foto = ObtenerArrayImagenPerfil(),
                                           MasInformacion = txtMasInformacion.Text
                                       };
                AdministracionCuenta.CrearCuenta(usuario);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected byte[] ObtenerArrayImagenPerfil()
        {
            byte[] arrayImagen = null;
            try
            {
                if (!String.IsNullOrEmpty(m_imagenUsuarioPath))
                {
                    var fileInfo = new FileInfo(Server.MapPath("/" + m_imagenUsuarioPath));
                    arrayImagen = new byte[fileInfo.Length];
                    var fileStream = fileInfo.OpenRead();
                    fileStream.Read(arrayImagen, 0, arrayImagen.Length);
                    fileStream.Close();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return arrayImagen;
        }

        protected void View3_Activate(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(m_imagenUsuarioPath))
            {
                ScriptManager.RegisterClientScriptBlock(View3, View3.GetType(), "imgFoto",
                    "top.document.getElementById('imgFoto').src='" + m_imagenUsuarioPath + "';", true);
            }
        }

        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    CargarDdlPaises();
            //}
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "cssWij",
                "AplicarCCS();", true);
        }


        //public void CargarDdlPaises()
        //{
        //    ddlPais.DataSource = FuenteDatosControl.Instancia.ObtenerPaises();
        //    ddlPais.DataTextField = "Dato";
        //    ddlPais.DataValueField = "Valor";
        //    ddlPais.DataBind();
        //    ddlPais.Items.Insert(0, new ListItem(" -- Seleccione un departamento -- ", "0")); 
        //}

        //[System.Web.Services.WebMethod]
        //public static List<ListaDesplegable> ObtenerDepartamentos(string pPais)
        //{
        //    return FuenteDatosControl.Instancia.ObtenerDepartamentos(Int32.Parse(pPais));
        //}

        //[System.Web.Services.WebMethod]
        //public List<ListaDesplegable> ObtenerCiudades(string pDepartamento)
        //{
        //    return FuenteDatosControl.Instancia.ObtenerCiudades(Int32.Parse(pDepartamento));
        //}



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
    }
}