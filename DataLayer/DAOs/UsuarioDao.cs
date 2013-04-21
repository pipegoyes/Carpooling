using System;
using Entities.Negocio;
using DataLayer.ModeloEntityFramework;
using DataLayer.Transformador;
using System.Linq;

namespace DataLayer.DAOs
{
    public class UsuarioDao : BaseDao
    {
        private static UsuarioDao _instancia = null;
                
        //Contructor
        private UsuarioDao()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static UsuarioDao Instancia
        {
            get { return _instancia ?? (_instancia = new UsuarioDao()); }
        }

        //Metodo para insertar un registro a la tabla usuario
        public void Insertar(Usuario pUsuario)
        {
            EstablecerConexion();
            var usuario = ToDataEntity.Instancia.ToUsuario(pUsuario);
            Conexion.USUARIO.Add(usuario);
            ConfirmarCambios();
        }

        public Usuario ObtenerPorId(string pIdUsuario)
        {
            EstablecerConexion();
            USUARIO usuarioDB = (from u in Conexion.USUARIO
                                 where u.ID_USUARIO.Trim().ToLower() == pIdUsuario
                                 select u).FirstOrDefault();
            if(usuarioDB != null)
                return ToBusinessEntity.Instancia.ToUsuario(usuarioDB);
            return null;
        }

        public Usuario ObtenerPorEmail(string pEmailUsuario)
        {
            EstablecerConexion();
            USUARIO usuarioDB = (from u in Conexion.USUARIO
                                 where u.EMAIL.Trim().ToLower() == pEmailUsuario
                                 select u).FirstOrDefault();
            if (usuarioDB != null)
                return ToBusinessEntity.Instancia.ToUsuario(usuarioDB);
            return null;
        }

        //este metodo talvez se borre porque no lo uso      
        private CIUDAD ObtenerCiudadPorId(int pIdCiudad)
        { 
            EstablecerConexion();
            CIUDAD ciudadDB = (from c in Conexion.CIUDAD.Include("DEPARTAMENTO.PAIS")
                               where c.ID_CIUDAD == pIdCiudad
                               select c).FirstOrDefault();
            return ciudadDB;
        }
    }
}
