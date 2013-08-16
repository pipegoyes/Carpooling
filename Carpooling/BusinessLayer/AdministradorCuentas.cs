using System;
using System.Configuration;
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
        public bool CrearCuenta(Usuario pUsuario)
        {
            //TODO: Verifica que el usuario no exista

            //Envia el usuario para su insercion en la base de datos
            return UsuarioDao.Instancia.Insertar(pUsuario);
        }

        //Valida y modifica un usuario
        public bool ModificarCuenta(Usuario pUsuario)
        {
            //TODO: Verifica que el usuario no exista

            //Envia el usuario para su insercion en la base de datos
            return UsuarioDao.Instancia.Actualizar(pUsuario);
        }

        //Actualizar la fecha de ultimo ingreso
        public bool ActualizarUltimoIngreso(Usuario pUsuario)
        {
            pUsuario.FechaUltimoIngreso = DateTime.Now;
            return UsuarioDao.Instancia.ActualizarUltimoIngreso(pUsuario);
        }

        //Desactivar la cuenta
        public bool DesactivarCuenta(Usuario pUsuario)
        {
            pUsuario.Estado = UsuarioEstado.Inactiva;
            return UsuarioDao.Instancia.ActualizarEstado(pUsuario);
        }

        //Activar la cuenta
        public bool ActivarCuenta(string pIdEmailUsuario)
        {
            Usuario usuario;
            pIdEmailUsuario.Trim().ToLower();
            if (pIdEmailUsuario.Contains("@"))
                usuario = UsuarioDao.Instancia.ObtenerPorEmail(pIdEmailUsuario);
            else
                usuario = UsuarioDao.Instancia.ObtenerPorId(pIdEmailUsuario);

            if (usuario != null)
            {
                usuario.Estado = UsuarioEstado.Activo;
                return UsuarioDao.Instancia.ActualizarEstado(usuario);
            }
            return false;
        }

        //Metodo para actualizar la contraseña
        public bool ActualizarContrasenia(Usuario pUsuario, string pContraseniaActual, string pContraseniaNueva, out string pMensajeRetorno)
        {
            pMensajeRetorno = string.Empty;
            if (pContraseniaActual != DesencriptarContrasenia(pUsuario.Contrasenia))
            {
                pMensajeRetorno = "Contraseña actual incorrecta.";
                return false;
            }
            pUsuario.Contrasenia = AdministradorCuentas.Instancia.EncriptarContrasenia(pContraseniaNueva);
            return UsuarioDao.Instancia.ActualizarContrasenia(pUsuario);
        }

        public Usuario ConsultarUsuarioPorId(string pIdUsuario)
        {
            return UsuarioDao.Instancia.ObtenerPorId(pIdUsuario);
        }

        public bool AutenticarUsuario(string pIdEmailUsuario, string pContrasenia, out Usuario pUsuario)
        {
            pIdEmailUsuario.Trim().ToLower();
            if (pIdEmailUsuario.Contains("@"))
                pUsuario = UsuarioDao.Instancia.ObtenerPorEmail(pIdEmailUsuario);
            else
                pUsuario = UsuarioDao.Instancia.ObtenerPorId(pIdEmailUsuario);

            if (pUsuario != null)
            {
                if (pUsuario.Estado == UsuarioEstado.Activo)
                {
                    string contraseniaDbDesencriptada = this.DesencriptarContrasenia(pUsuario.Contrasenia);
                    contraseniaDbDesencriptada.Trim();
                    if (contraseniaDbDesencriptada.Equals(pContrasenia.Trim()))
                    {
                        ActualizarUltimoIngreso(pUsuario);
                        return true;
                    }
                }
           }
           return false;
        }

        public bool RecuperarContrasenia(string pIdEmailUsuario)
        {
            Usuario usuario;
            pIdEmailUsuario.Trim().ToLower();
            if (pIdEmailUsuario.Contains("@"))
                usuario = UsuarioDao.Instancia.ObtenerPorEmail(pIdEmailUsuario);
            else
                usuario = UsuarioDao.Instancia.ObtenerPorId(pIdEmailUsuario);

            if (usuario != null)
            {
                string nuevaContrasenia = System.Web.Security.Membership.GeneratePassword(12, 3);
                string nuevaContraseniaEncriptada = EncriptarContrasenia(nuevaContrasenia);
                usuario.Contrasenia = nuevaContraseniaEncriptada;
                if (UsuarioDao.Instancia.ActualizarContrasenia(usuario))
                {
                    AdministradorCorreosElectronicos.Instancia.CorreoRecuperacionContrasenia(usuario);
                    return true;
                }
            }
            return false;            
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
        public string GuardarImagenCuenta(Image pImage, string pPathSever, string pIdUsuario)
        {
            string fullPathImagen = pPathSever + ConfigurationManager.AppSettings["CacheImagenFolder"] + "/" + pIdUsuario + ".jpg";
            pImage.Save(fullPathImagen, ImageFormat.Jpeg);
            return fullPathImagen;
        }

        //Guarda una imagen en un directorio espeficificado
        public string ObtenerImagenCuenta(string pPathSever, string pIdUsuario)
        {
            string fullPathImagen = pPathSever + ConfigurationManager.AppSettings["CacheImagenFolder"] + "/" + pIdUsuario + ".jpg";
            if (File.Exists(fullPathImagen))
                return fullPathImagen;
            else
            {
 
            }
            return string.Empty;
        }

        //Borrar imagen de cuenta temporal
        public void EliminarImagenTemporal(string pPathSever, string pIdUsuario)
        {
            string fullPathImagen_new = pPathSever + ConfigurationManager.AppSettings["CacheImagenFolder"] + "/" + pIdUsuario + "_new.jpg";
            if (File.Exists(fullPathImagen_new))
                File.Delete(fullPathImagen_new);        
        }

        public byte[] ActualizarImagenCuenta(string pRutaSever, string pRutaImagenActual, string pRutaImagenNueva, out bool pImagenesIguales, out string pRutaImagenMostrar)
        {
            pImagenesIguales = false;
            byte[] imagenNueva = AdministradorCuentas.Instancia.ObtenerBinaryFromImagen(pRutaImagenNueva);            
            string rutaImagenHombre = pRutaSever + ConfigurationManager.AppSettings["ImagenCuentaHombre"].Replace("~/", "").Replace("/","\\");
            string rutaImagenMujer = pRutaSever + ConfigurationManager.AppSettings["ImagenCuentaMujer"].Replace("~/", "").Replace("/", "\\");
                      
            byte[] imagenHombre = AdministradorCuentas.Instancia.ObtenerBinaryFromImagen(rutaImagenHombre);
            if (imagenNueva.SequenceEqual(imagenHombre) || Path.GetFullPath(rutaImagenHombre).Equals(Path.GetFullPath(pRutaImagenNueva)))
            {
                if (File.Exists(pRutaImagenActual) && !Path.GetFullPath(rutaImagenHombre).Equals(Path.GetFullPath(pRutaImagenActual)) && !Path.GetFullPath(rutaImagenMujer).Equals(Path.GetFullPath(pRutaImagenActual)))
                    File.Delete(pRutaImagenActual);
                pRutaImagenMostrar = rutaImagenHombre;
                return null;
            }

            byte[] imagenMujer = AdministradorCuentas.Instancia.ObtenerBinaryFromImagen(rutaImagenMujer);
            if (imagenNueva.SequenceEqual(imagenMujer) || Path.GetFullPath(rutaImagenMujer).Equals(Path.GetFullPath(pRutaImagenNueva)))
            {
                if (File.Exists(pRutaImagenActual) && !Path.GetFullPath(rutaImagenHombre).Equals(Path.GetFullPath(pRutaImagenActual)) && !Path.GetFullPath(rutaImagenMujer).Equals(Path.GetFullPath(pRutaImagenActual)))
                    File.Delete(pRutaImagenActual);
                pRutaImagenMostrar = rutaImagenMujer;
                return null;
            }

            byte[] imagenActual = AdministradorCuentas.Instancia.ObtenerBinaryFromImagen(pRutaImagenActual);
            if (imagenNueva.SequenceEqual(imagenActual))
            {
                pImagenesIguales = true;
                pRutaImagenMostrar = pRutaImagenActual;
                if (File.Exists(pRutaImagenNueva) && !Path.GetFullPath(pRutaImagenActual).Equals(Path.GetFullPath(pRutaImagenNueva)))
                    File.Delete(pRutaImagenNueva);
                return null;
            }
            else
            {
                if (!Path.GetFullPath(rutaImagenHombre).Equals(Path.GetFullPath(pRutaImagenActual)) && !Path.GetFullPath(rutaImagenMujer).Equals(Path.GetFullPath(pRutaImagenActual)))
                {
                    File.Copy(pRutaImagenNueva, pRutaImagenActual, true);
                }
                else
                {
                    pRutaImagenActual = pRutaImagenNueva.Replace("_new", "");
                    if (!File.Exists(pRutaImagenActual))
                        File.Move(pRutaImagenNueva, pRutaImagenActual);
                    else
                    {
                        File.Copy(pRutaImagenNueva, pRutaImagenActual,true);
                        File.Delete(pRutaImagenNueva);
                    }
                }
                pRutaImagenMostrar = pRutaImagenActual;
                return imagenNueva;
            }
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
