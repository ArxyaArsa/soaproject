﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartHomeLocal.DataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SmartHomeLocalDbEntities : DbContext
    {
        public SmartHomeLocalDbEntities()
            : base("name=SmartHomeLocalDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Action> Actions { get; set; }
        public virtual DbSet<Command> Commands { get; set; }
        public virtual DbSet<Device> Devices { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<ReturnLog> ReturnLogs { get; set; }
    }
}
