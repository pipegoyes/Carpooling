using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Imaging;
using Image = System.Drawing.Image;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BusinessLayer;

namespace Carpooling
{
    public partial class NuevaCuenta : System.Web.UI.Page
    {
        private Stream m_imagenUsuarioBinary;
        private string m_imagenUsuarioPath;
        private string m_folderProfileImages;
    
  
        protected void Page_Load(object sender, EventArgs e)
        {                       
            //TODO: la var m_folderProfileImages debe cargarse desde un archivo de configuracion
            m_folderProfileImages = "ProfileImages";

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
                var nuevoUsuario = new USUARIO();
                nuevoUsuario.ID_USUARIO = txtNombreUsuario.Text;
                nuevoUsuario.NOMBRES = txtNombres.Text;
                nuevoUsuario.APELLIDOS = txtApellidos.Text;
                nuevoUsuario.CONTRASENIA = txtContrasena.Text;
                nuevoUsuario.FECHA_NACIMIENTO = txtFechaNacimiento_CalendarExtender.SelectedDate;
                nuevoUsuario.CIUDAD_RESIDENCIA = txtCiudad.Text;
                nuevoUsuario.EMAIL = txtCorreoElectronico.Text;
                nuevoUsuario.SEXO = Byte.Parse(rdbSexo.SelectedValue);
                nuevoUsuario.OCUPACION = txtOcupacion.Text;
                nuevoUsuario.TELEFONO_FIJO = txtTelefonoFijo.Text;
                nuevoUsuario.TELEFONO_MOVIL = txtTelefonoMovil.Text;
                nuevoUsuario.FUMADOR = chkFumador.Checked;
                nuevoUsuario.VEHICULO_PROPIO = chkVehiculoPropio.Checked;
                //nuevoUsuario.FOTO = imgFoto.
                nuevoUsuario.MAS_INFO = txtMasInformacion.Text;
            }
            catch (Exception ex)
            {                    
                throw;
            }
        }

        protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            try
            {
                m_imagenUsuarioBinary = AsyncFileUpload1.FileContent;

                if (m_imagenUsuarioBinary == null) return;

                // write the image using a guid name instead to avoid conflicts ... 
                var uniqueName = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";
                var destFolder = Server.MapPath(AppRelativeTemplateSourceDirectory + "/" + m_folderProfileImages + "/");
                var imageUpload = Image.FromStream(m_imagenUsuarioBinary);
                
                // all images end up as jpg  
                imageUpload.Save(destFolder + uniqueName, ImageFormat.Jpeg);

                //arma la ruta relativa de la imagen
                m_imagenUsuarioPath = "/" + m_folderProfileImages + "/" + uniqueName;

                //registra los scripts en el cliente para cambiar el valor de los controles              
                ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "hfdImagePath",
                    "top.document.getElementById('hfdImagePath').value='" + m_imagenUsuarioPath + "'; " +
                    "top.document.getElementById('imgFotoModal').src='" + m_imagenUsuarioPath + "';" ,true);
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
                ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "imgFoto",
                    "top.document.getElementById('imgFoto').src='" + m_imagenUsuarioPath + "';", true);
            }
        }
    }
}