//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.ModeloEntityFramework.P
{
    using System;
    using System.Collections.Generic;
    
    public partial class CORDENADA
    {
        public CORDENADA()
        {
            this.TRAYECTO = new HashSet<TRAYECTO>();
            this.TRAYECTO1 = new HashSet<TRAYECTO>();
        }
    
        public long ID_CORDENADA { get; set; }
        public Nullable<decimal> LONGITUD { get; set; }
        public Nullable<decimal> LATITUD { get; set; }
        public string DIRECCION { get; set; }
        public string TIPO { get; set; }
    
        public virtual ICollection<TRAYECTO> TRAYECTO { get; set; }
        public virtual ICollection<TRAYECTO> TRAYECTO1 { get; set; }
    }
}
