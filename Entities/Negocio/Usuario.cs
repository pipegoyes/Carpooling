using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    class Usuario
    {
        public string IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Contrasenia { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Email { get; set; }
        public int CiudadResidencia { get; set; }
        public byte Sexo { get; set; }
        public int Ocupacion { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoMovil { get; set; }
        public bool Fumador { get; set; }
        public bool VehiculoPropip { get; set; }
        public byte[] Foto { get; set; }
        public string MasInformacion { get; set; }
    }
}
