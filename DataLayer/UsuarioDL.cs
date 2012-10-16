using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;

namespace DataLayer
{
    public static class UsuarioDL
    {
        //Metodo para insertar un registro a la tabla usuario
        public static void InsertarUsuario(USUARIO p_Usuario)
        {
            try
            {
                var dbContext = new CARPOOLINGEntities();
                dbContext.USUARIO.Add(p_Usuario);
                dbContext.SaveChanges();
            }
            catch (Exception ex)
            {                    
                throw ex;
            }
        }
    }
}
