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
    
        public int IdDepartamento { get; set; }
        public string NombreDepartamento { get; set; }
        public int IdPais { get; set; }
    
        public virtual ICollection<CIUDAD> CIUDAD { get; set; }
        public virtual PAIS PAIS { get; set; }
    }
}
