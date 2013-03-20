using System;
using Entities.Negocio;
using DataLayer.ModeloEntityFramework;
using DataLayer.Transformador;

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
            Conexion.SaveChanges();
        }
    }
}
