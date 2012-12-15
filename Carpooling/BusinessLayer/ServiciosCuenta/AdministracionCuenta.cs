using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;
using DataLayer.DAOs;

namespace BusinessLayer.ServiciosCuenta
{
    public static class AdministracionCuenta
    {
        //Valida e inserta un nuevo usuario
        public static void CrearCuenta(Usuario pUsuario)
        {
            //Verifica que el usuario no exista
            //TODO:

            //Envia el usuario para su insercion en la base de datos
            UsuarioDao.ObtenerInstancia().Insertar(pUsuario);
        }
    }
}
