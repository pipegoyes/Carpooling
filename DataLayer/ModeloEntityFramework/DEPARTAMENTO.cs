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
    
    public partial class DEPARTAMENTO
    {
        public DEPARTAMENTO()
        {
            this.CIUDAD = new HashSet<CIUDAD>();
        }
    
        public int ID_DEPARTAMENTO { get; set; }
        public string NOMBRE_DEPARTAMENTO { get; set; }
        public int ID_PAIS { get; set; }
    
        public virtual ICollection<CIUDAD> CIUDAD { get; set; }
        public virtual PAIS PAIS { get; set; }
    }
}
