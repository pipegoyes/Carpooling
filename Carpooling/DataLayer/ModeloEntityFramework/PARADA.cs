//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.ModeloEntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class PARADA
    {
        public long ID_PARADA { get; set; }
        public long ID_TRAYECTO { get; set; }
        public decimal LATITUD { get; set; }
        public decimal LONGITUD { get; set; }
        public string DIRECCION { get; set; }
        public int NUMERO_PARADA { get; set; }
        public string TIPO_PARADA { get; set; }
    
        public virtual TRAYECTO TRAYECTO { get; set; }
    }
}