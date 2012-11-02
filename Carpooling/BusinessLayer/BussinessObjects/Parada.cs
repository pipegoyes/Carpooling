using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayer.BussinessObjects
{
    public class Parada
    {
        //rideWaypoints.push({
        //        location: $(this).val(),
        //        stopover: true
        //    });
        public string location { get; set; }
        public bool stopover { get; set; }

    }
}
