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
    
    public partial class PAIS
    {
        public PAIS()
        {
            this.DEPARTAMENTO = new HashSet<DEPARTAMENTO>();
        }
    
        public int ID_PAIS { get; set; }
        public string NOMBRE_PAIS { get; set; }
    
        public virtual ICollection<DEPARTAMENTO> DEPARTAMENTO { get; set; }
    }
}