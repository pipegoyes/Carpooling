using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        //Obtiene y mantiene una unica instancia de la clase
        public static AdministradorCuentas ObtenerInstancia()
        {
            return _instancia ?? (_instancia = new AdministradorCuentas());
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
