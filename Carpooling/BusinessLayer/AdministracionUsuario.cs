using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using Entities;

namespace BusinessLayer
{
    public static class AdministracionUsuario
    {
        //Valida e inserta un nuevo usuario
        public static void CrearUsuario(USUARIO pUsuario)
        {
            try
            {
                //Verifica que el usuario no exista
                //TODO:

                //Envia el usuario para su insercion en la base de datos
                UsuarioDL.InsertarUsuario(pUsuario);
            }
            catch (Exception ex)
            {                    
                throw ex;
            }
        }
    }
}
