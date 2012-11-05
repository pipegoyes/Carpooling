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
        public string Location { get; set; }
        public bool Stopover { get; set; }

    }
}
