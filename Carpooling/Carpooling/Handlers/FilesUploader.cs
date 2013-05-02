using System;
using System.Configuration;
using System.Drawing.Imaging;
using Image = System.Drawing.Image;
using System.Web;
using System.IO;

namespace Carpooling.Handlers
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
            //var hfdImagePathValue = request.Form["hfdImagePath"]; todo: borrar la imagen de la carpeta

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

                //toma los bytes de la imagen
                var streamImagen = request.InputStream;
                // write the image using a guid name instead to avoid conflicts
                var cacheImagenFolder = ConfigurationManager.AppSettings["CacheImagenFolder"];               
                var uniqueName = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";
                var destFolder = request.PhysicalApplicationPath + "/" + cacheImagenFolder + "/";
                
                // all images end up as jpg
                var imageUpload = Image.FromStream(streamImagen);
                imageUpload.Save(destFolder + uniqueName, ImageFormat.Jpeg);
                context.Session["imagenCuenta"] = uniqueName;

                //arma la ruta relativa de la imagen para enviarla al cliente en la respuesta
                var imagenUsuarioPath = "/" + cacheImagenFolder + "/" + uniqueName;

                //envia la respuesta al cliente
                context.Response.Write("{\"success\":true, \"userImage\":\"" + imagenUsuarioPath + "\"}");
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
