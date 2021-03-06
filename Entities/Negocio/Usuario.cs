﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace Entities.Negocio
{
    [Flags]
    public enum UsuarioEstado : int
    {
        Activo = 1,
        Inactivo = 2
    }

    public class Usuario
    {
        public string Apellido { get; set; }
        public string Email { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaUltimoIngreso { get; set; }
        public byte[] Foto { get; set; }
        public bool Fumador { get; set; }
        public string Genero { get; set; }
        public string IdUsuario { get; set; }
        public string InformacionAdicional { get; set; }
        public string Nombre { get; set; }
        public Ocupacion Ocupacion { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoMovil { get; set; }
        public bool VehiculoPropio { get; set; }      
        public string Contrasenia { get; set; }
        public decimal? Reputacion { get; set; }              
        public UbicacionGeografica ResidenciaUbicacion { get; set; }
        public UsuarioEstado Estado { get; set; }

        public string ObtenerNombreApellidos()
        {
            string nombreMostrarUsuario = Nombre + " " + Apellido;
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(nombreMostrarUsuario.Trim().ToLower());
        }
    }
}
