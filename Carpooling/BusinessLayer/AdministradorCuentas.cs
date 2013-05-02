using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Drawing.Imaging;
using Image = System.Drawing.Image;
using Entities.Negocio;
using DataLayer.DAOs;

namespace BusinessLayer
{
    public class AdministradorCuentas
    {
        private static AdministradorCuentas _instancia = null;
                
        //Contructor
        private AdministradorCuentas()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministradorCuentas Instancia
        {
            get { return _instancia ?? (_instancia = new AdministradorCuentas()); } 
        }


        //Valida e inserta un nuevo usuario
        public void CrearCuenta(Usuario pUsuario)
        {
            //TODO: Verifica que el usuario no exista

            //Envia el usuario para su insercion en la base de datos
            UsuarioDao.Instancia.Insertar(pUsuario);
        }

        public Usuario AutenticarUsuario(string pIdEmailUsuario, string pContrasenia)
        {
            Usuario usuario;
            pIdEmailUsuario.Trim().ToLower();
            if (pIdEmailUsuario.Contains("@"))
                usuario = UsuarioDao.Instancia.ObtenerPorEmail(pIdEmailUsuario);
            else
                usuario = UsuarioDao.Instancia.ObtenerPorId(pIdEmailUsuario);

            if(usuario != null)
            {
                string contraseniaDbDesencriptada = this.DesencriptarContrasenia(usuario.Contrasenia);
                contraseniaDbDesencriptada.Trim().ToLower();
                if (contraseniaDbDesencriptada.Equals(pContrasenia.Trim().ToLower()))
                    return usuario;
           }
            return null;
        }

        //Obtiene un array binary que representa la imagen del path especificado
        public byte[] ObtenerBinaryFromImagen(string pRutaImagen)
        {
            byte[] arrayImagen = null;
            if (!string.IsNullOrEmpty(pRutaImagen))
            {
                var fileInfo = new FileInfo(pRutaImagen);
                arrayImagen = new byte[fileInfo.Length];
                var fileStream = fileInfo.OpenRead();
                fileStream.Read(arrayImagen, 0, arrayImagen.Length);
                fileStream.Close();
            }
            return arrayImagen;
        }

        //Obtiene la imagen representada en un array binary
        public Image ObtenerImageFromBinary(byte[] pBinaryImage)
        {
            Stream stream = new MemoryStream(pBinaryImage);
            Image image = Image.FromStream(stream);
            return image;
        }

        //Guarda una imagen en un directorio espeficificado
        public string GuardarImagenSever(Image pImage, string pPathSever, string pFileName)
        {
            string fileName = pFileName + ".jpg";
            pImage.Save(pPathSever + fileName, ImageFormat.Jpeg);
            return fileName;
        }

        //Encripta la contraseña
        public string EncriptarContrasenia(string pContrasenia)
        {
            byte[] bytesTexto = Encoding.Unicode.GetBytes(pContrasenia);
            byte[] bytesTextoEncriptado = ProtectedData.Protect(bytesTexto, null, DataProtectionScope.CurrentUser);
            string textoEncriptadoBase64 = Convert.ToBase64String(bytesTextoEncriptado);
            return textoEncriptadoBase64;
        }

        //Desencripta la contraseña
        public string DesencriptarContrasenia(string pContraseniaEncriptada)
        {
            byte[] bytesTextoEncriptado = Convert.FromBase64String(pContraseniaEncriptada);

            byte[] bytesTexto = ProtectedData.Unprotect(bytesTextoEncriptado, null, DataProtectionScope.CurrentUser);
            string textoDesencriptado = Encoding.Unicode.GetString(bytesTexto);
            return textoDesencriptado;
        }
    }
}
