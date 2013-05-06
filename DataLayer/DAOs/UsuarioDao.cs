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
        public bool Insertar(Usuario pUsuario)
        {
            EstablecerConexion();
            var usuario = ToDataEntity.Instancia.ToUsuario(pUsuario);
            Conexion.USUARIO.Add(usuario);
            return ConfirmarCambios();
        }

        //Metodo para modificar un registro a la tabla usuario
        public bool Actualizar(Usuario pUsuario)
        {
            var usuario = ToDataEntity.Instancia.ToUsuario(pUsuario);
            EstablecerConexion();
            Conexion.USUARIO.Attach(usuario);
            var entidad = Conexion.Entry(usuario);
            entidad.Property(x => x.APELLIDO).IsModified = true;
            entidad.Property(x => x.EMAIL).IsModified = true;
            entidad.Property(x => x.FECHA_NACIMIENTO).IsModified = true;
            entidad.Property(x => x.FOTO).IsModified = true;
            entidad.Property(x => x.FUMADOR).IsModified = true;
            entidad.Property(x => x.GENERO).IsModified = true;
            entidad.Property(x => x.INFORMACION_ADICIONAL).IsModified = true;
            entidad.Property(x => x.NOMBRE).IsModified = true;
            entidad.Property(x => x.ID_OCUPACION).IsModified = true;
            entidad.Property(x => x.TELEFONO_FIJO).IsModified = true;
            entidad.Property(x => x.TELEFONO_MOVIL).IsModified = true;
            entidad.Property(x => x.VEHICULO_PROPIO).IsModified = true;
            entidad.Property(x => x.CONTRASENIA).IsModified = true;
            entidad.Property(x => x.ID_CIUDAD_RESIDENCIA).IsModified = true;
            return ConfirmarCambios();
        }

        //Metodo para actualizar la fecha de ultimo ingreso
        public bool ActualizarUltimoIngreso(Usuario pUsuario)
        {
            var usuario = ToDataEntity.Instancia.ToUsuario(pUsuario);
            EstablecerConexion();
            Conexion.USUARIO.Attach(usuario);
            var entidad = Conexion.Entry(usuario);
            entidad.Property(x => x.FECHA_ULTIMO_INGRESO).IsModified = true;
            return ConfirmarCambios();
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


    }
}
