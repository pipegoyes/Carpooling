using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayer.BussinessObjects
{
    public class DirectionRequest
    {
    //    Forma del objeto 
    //    var directionRequest = {
    //    origin: ciudadOrigen,
    //    destination: ciudadDestino,
    //    waypoints: rideWaypoints,
    //    provideRouteAlternatives: false,
    //    travelMode: google.maps.TravelMode.DRIVING
    //};

        public string origin { get; set; }
        public string destination { get; set; }
        public List<Parada> waypoints { get; set; }
        public bool provideRouteAlternatives { get; set; }
    }
}
