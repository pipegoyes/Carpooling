using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Entities.Aplicacion;
using DataLayer.DAOs;

namespace BusinessLayer.ServiciosGUI
{
    public class FuenteDatosControl
    {
        private static FuenteDatosControl _instancia = null;
                
        //Contructor
        private FuenteDatosControl()
        {
        }

        //Obtiene y mantiene una unica instancia de la clase
        public static FuenteDatosControl Instancia
        {
            get { return _instancia ?? (_instancia = new FuenteDatosControl()); } 
        }

        //Obtiene el listado de paises
        public List<ListaDesplegable> ObtenerPaises()
        {
            return ListaDesplegableDao.Instancia.ObtenerPaises();
        }

        //Obtiene el listado de departamentos de un pais determinado
        public List<ListaDesplegable> ObtenerDepartamentos(int pIdPais)
        {
            return ListaDesplegableDao.Instancia.ObtenerDepartamentos(pIdPais);
        }

        //Obtiene el listado de ciudades de un departamento determinado
        public List<ListaDesplegable> ObtenerCiudades(int pIdDepartamento)
        {
            return ListaDesplegableDao.Instancia.ObtenerCiudades(pIdDepartamento);
        }

        //Obtiene el listado de ocupaciones
        public List<ListaDesplegable> ObtenerOcupaciones()
        {
            return ListaDesplegableDao.Instancia.ObtenerOcupaciones();
        }

        //Obtiene los dias del mes
        public List<int> ObtenerDiasMes(int pNumeroMes, int pAnio)
        {
            switch (pNumeroMes)
            {
                case 1: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 };
                case 2:
                {
                    if (pAnio % 4 == 0)
                        return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29 };
                    else
                        return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 };
                }
                case 3: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 }; 
                case 4: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 }; 
                case 5: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 }; 
                case 6: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 }; 
                case 7: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 }; 
                case 8: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 }; 
                case 9: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 }; 
                case 10: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 };
                case 11: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 };
                case 12: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 };
                default: return new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 };
            }
        }
    }
}
