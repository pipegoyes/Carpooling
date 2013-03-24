using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;
using DataLayer.DAOs;

namespace BusinessLayer.ServiciosCuenta
{
    public class AdministracionCuenta
    {
        private static AdministracionCuenta _instancia = null;
                
        //Contructor
        private AdministracionCuenta()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministracionCuenta Instancia
        {
            get { return _instancia ?? (_instancia = new AdministracionCuenta()); } 
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministracionCuenta ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new AdministracionCuenta());
        }

        //Valida e inserta un nuevo usuario
        public static void CrearCuenta(Usuario pUsuario)
        {
            //Verifica que el usuario no exista
            //TODO:

            //Envia el usuario para su insercion en la base de datos
            UsuarioDao.Instancia.Insertar(pUsuario);
        }
    }
}
