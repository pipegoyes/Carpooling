using System;
using Image = System.Drawing.Image;
using System.Web;
using System.IO;

namespace Carpooling
{
    public class FilesUploader : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest request = context.Request;

            if (IsIE9(request))
            {
                ////byte[] buffer = new byte[request.ContentLength];
                ////using (BinaryReader br = new BinaryReader(request.Files["qqfile"].InputStream))
                ////    br.Read(buffer, 0, buffer.Length);

                ////string filename = Path.GetFileName(request.Files["qqfile"].FileName);
                ////File.WriteAllBytes(request.PhysicalApplicationPath + filename, buffer);

                context.Response.Write("{\"success\":true, \"userImage\": \"manuel\"}");
                context.Response.End();
            }
            else
            {
                ////byte[] buffer = new byte[request.ContentLength];
                ////using (BinaryReader br = new BinaryReader(request.InputStream))
                ////    br.Read(buffer, 0, buffer.Length);

                ////File.WriteAllBytes(request.PhysicalApplicationPath + request["qqfile"], buffer);


                var streamImagen = request.Files.Get(0).InputStream;
               

                // write the image using a guid name instead to avoid conflicts ... 
                var uniqueName = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";
                //var destFolder = Server.MapPath(AppRelativeTemplateSourceDirectory + "/" + m_folderProfileImages + "/");
                var imageUpload = Image.FromStream(streamImagen);

                //// all images end up as jpg  
                //imageUpload.Save(destFolder + uniqueName, ImageFormat.Jpeg);

                ////arma la ruta relativa de la imagen
                //m_imagenUsuarioPath = "/" + m_folderProfileImages + "/" + uniqueName;

                ////registra los scripts en el cliente para cambiar el valor de los controles              
                //ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "hfdImagePath",
                //    "top.document.getElementById('hfdImagePath').value='" + m_imagenUsuarioPath + "'; " +
                //    "top.document.getElementById('imgFotoModal').src='" + m_imagenUsuarioPath + "';" ,true);


                context.Response.Write("{\"success\":true, \"userImage\": \"manuel\"}");
                context.Response.End();


            }

            context.Response.Write("{error:\"Upload failed! Unexpected request.\"}");
            context.Response.End();

        }

        private bool IsIE9(HttpRequest request)
        {
            return request["qqfile"] == null;
        }

        #endregion
    }
}
