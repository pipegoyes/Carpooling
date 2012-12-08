using System;
using System.IO;
using System.Web.UI;

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
                //var nuevoUsuario = new USUARIO();
                //nuevoUsuario.ID_USUARIO = txtNombreUsuario.Text;
                //nuevoUsuario.NOMBRES = txtNombres.Text;
                //nuevoUsuario.APELLIDOS = txtApellidos.Text;
                //nuevoUsuario.CONTRASENIA = txtContrasena.Text;
                //nuevoUsuario.FECHA_NACIMIENTO = txtFechaNacimiento_CalendarExtender.SelectedDate;
                //nuevoUsuario.CIUDAD_RESIDENCIA = txtCiudad.Text;
                //nuevoUsuario.EMAIL = txtCorreoElectronico.Text;
                //nuevoUsuario.SEXO = Byte.Parse(rdbSexo.SelectedValue);
                //nuevoUsuario.OCUPACION = txtOcupacion.Text;
                //nuevoUsuario.TELEFONO_FIJO = txtTelefonoFijo.Text;
                //nuevoUsuario.TELEFONO_MOVIL = txtTelefonoMovil.Text;
                //nuevoUsuario.FUMADOR = chkFumador.Checked;
                //nuevoUsuario.VEHICULO_PROPIO = chkVehiculoPropio.Checked;
                //nuevoUsuario.FOTO = ObtenerArrayImagenPerfil();
                //nuevoUsuario.MAS_INFO = txtMasInformacion.Text;

                //AdministracionUsuario.CrearUsuario(nuevoUsuario);
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
                    var fileInfo = new FileInfo(Server.MapPath(AppRelativeTemplateSourceDirectory + m_imagenUsuarioPath));
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

        protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            try
            {
                //var streamImagen = AsyncFileUpload1.FileContent;

                //if (streamImagen == null) return;

                //// write the image using a guid name instead to avoid conflicts ... 
                //var uniqueName = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";
                //var destFolder = Server.MapPath(AppRelativeTemplateSourceDirectory + "/" + m_folderProfileImages + "/");
                //var imageUpload = Image.FromStream(streamImagen);

                //// all images end up as jpg  
                //imageUpload.Save(destFolder + uniqueName, ImageFormat.Jpeg);

                ////arma la ruta relativa de la imagen
                //m_imagenUsuarioPath = "/" + m_folderProfileImages + "/" + uniqueName;

                ////registra los scripts en el cliente para cambiar el valor de los controles              
                //ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "hfdImagePath",
                //    "top.document.getElementById('hfdImagePath').value='" + m_imagenUsuarioPath + "'; " +
                //    "top.document.getElementById('imgFotoModal').src='" + m_imagenUsuarioPath + "';" ,true);
            }
            catch (Exception ex)
            {
                throw;
            }
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
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "cssWij",
                "AplicarCCS();", true);
        }

        protected void View3_PreRender(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(View3, View3.GetType(), "Uploader",
            //    "CrearUploader();", true);
        }
    }
}