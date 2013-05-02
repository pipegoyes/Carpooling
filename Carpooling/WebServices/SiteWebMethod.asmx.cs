using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AjaxControlToolkit;
using BusinessLayer.ServiciosGUI;

namespace Carpooling.WebServices
{
    /// <summary>
    /// Summary description for SiteWebMethod
    /// </summary>
    [WebService(Namespace = "http://localwebmethods.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SiteWebMethod : System.Web.Services.WebService
    {
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public CascadingDropDownNameValue[] ObtenerPaisesDdl(string knownCategoryValues, string category)
        {
            return FuenteDatosControl.Instancia.ObtenerPaises().Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public CascadingDropDownNameValue[] ObtenerDepartamentosDdl(string knownCategoryValues, string category)
        {
            var keys = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerDepartamentos(Int32.Parse(keys["pais"])).Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public CascadingDropDownNameValue[] ObtenerCiudadesDdl(string knownCategoryValues, string category)
        {
            var keys = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            return FuenteDatosControl.Instancia.ObtenerCiudades(Int32.Parse(keys["departamento"])).Select(item => new CascadingDropDownNameValue { name = item.Dato, value = item.Valor }).ToArray();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<int> ObtenerDiasDdl(string pMes, string pAnio)
        {
            return FuenteDatosControl.Instancia.ObtenerDiasMes(Int32.Parse(pMes), Int32.Parse(pAnio));
        }
    }
}
