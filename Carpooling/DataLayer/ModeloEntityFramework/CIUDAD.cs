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
    
    public partial class CIUDAD
    {
        public CIUDAD()
        {
            this.USUARIO = new HashSet<USUARIO>();
        }
    
        public int ID_CIUDAD { get; set; }
        public string NOMBRE_CIUDAD { get; set; }
        public Nullable<int> ID_DEPARTAMENTO { get; set; }
    
        public virtual DEPARTAMENTO DEPARTAMENTO { get; set; }
        public virtual ICollection<USUARIO> USUARIO { get; set; }
    }
}
