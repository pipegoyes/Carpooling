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
    
    public partial class OCUPACION
    {
        public OCUPACION()
        {
            this.USUARIO = new HashSet<USUARIO>();
        }
    
        public int ID_OCUPACION { get; set; }
        public string NOMBRE_OCUPACION { get; set; }
    
        public virtual ICollection<USUARIO> USUARIO { get; set; }
    }
}
