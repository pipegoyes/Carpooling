using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BusinessLayer;

namespace Carpooling
{
    public partial class NuevaCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnAtras1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnSiguiente1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnAtras2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;            
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            try
            {
                var nuevoUsuario = new USUARIO();
                nuevoUsuario.ID_USUARIO = txtNombreUsuario.Text;
                nuevoUsuario.NOMBRES = txtNombres.Text;
                nuevoUsuario.APELLIDOS = txtApellidos.Text;
                nuevoUsuario.CONTRASENIA = txtContrasena.Text;
                nuevoUsuario.FECHA_NACIMIENTO = txtFechaNacimiento_CalendarExtender.SelectedDate;
                nuevoUsuario.CIUDAD_RESIDENCIA = txtCiudad.Text;
                nuevoUsuario.EMAIL = txtCorreoElectronico.Text;
                nuevoUsuario.SEXO = Byte.Parse(rdbSexo.SelectedValue);
                nuevoUsuario.OCUPACION = txtOcupacion.Text;
                nuevoUsuario.TELEFONO_FIJO = txtTelefonoFijo.Text;
                nuevoUsuario.TELEFONO_MOVIL = txtTelefonoMovil.Text;
                nuevoUsuario.FUMADOR = chkFumador.Checked;
                nuevoUsuario.VEHICULO_PROPIO = chkVehiculoPropio.Checked;
                //nuevoUsuario.FOTO = imgFoto.
                //nuevoUsuario.MAS_INFO = txtMasInformacion.Text;

            }
            catch (Exception ex)
            {
                    
                throw;
            }
        }
    }
}