﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.ModeloEntityFramework.M
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CARPOOLINGEntitiesM : DbContext
    {
        public CARPOOLINGEntitiesM()
            : base("name=CARPOOLINGEntitiesM")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<CIUDAD> CIUDAD { get; set; }
        public DbSet<DEPARTAMENTO> DEPARTAMENTO { get; set; }
        public DbSet<OCUPACION> OCUPACION { get; set; }
        public DbSet<PAIS> PAIS { get; set; }
        public DbSet<USUARIO> USUARIO { get; set; }
    }
}
