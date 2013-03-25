using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.Negocio;

namespace Entities.Aplicacion
{
// ReSharper disable InconsistentNaming
    public class ViajeJSON
// ReSharper restore InconsistentNaming
    {
        //TODO pendiente por los atributos
        public Parada Origin { get; set; }
        public Parada Destination { get; set; }
        public List<Parada> Waypoints { get; set; }
        public int Cupos { get; set; }
        public string Tarifa { get; set; }
        public string FechaPartida { get; set; }
        public string HoraPartida { get; set; }

        //jsonViaje.origin = listCoordenadas[0];
        //jsonViaje.destination = listCoordenadas[1];
        //jsonViaje.wayPoints = listParadas;
        //jsonViaje.tarifa = $("[id*=txbTarifa]").val();
        //jsonViaje.cupos = $("[id*=txbCupos]").val();
        //jsonViaje.fechaPartida = $("[id*=txbFechaPartida]").val();
        //jsonViaje.horaPartida = $("[id*=txbHora]").val();
    }
}
