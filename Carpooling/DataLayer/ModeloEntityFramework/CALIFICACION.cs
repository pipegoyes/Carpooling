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
    
    public partial class CALIFICACION
    {
        public long ID_CALIFICACION { get; set; }
        public decimal PUNTAJE { get; set; }
        public long ID_VIAJE { get; set; }
        public string ID_EVALUADOR { get; set; }
        public string ID_EVALUADO { get; set; }
        public Nullable<System.DateTime> FECHA_REALIZACION { get; set; }
        public string COMENTARIO { get; set; }
    
        public virtual VIAJE VIAJE { get; set; }
        public virtual USUARIO USUARIO_EVALUADO { get; set; }
        public virtual USUARIO USUARIO_EVALUADOR { get; set; }
    }
}
