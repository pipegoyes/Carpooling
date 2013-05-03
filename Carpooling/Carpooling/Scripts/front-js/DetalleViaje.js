$(document).ready(function () {
    // Handler for .ready() called.
    //alert("Estoy en la parte exitosa");
    initialize();

});

var geocoder;
var map;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var rutaValida = false;

function initialize() {
    geocoder = new google.maps.Geocoder();
    directionsDisplay = new google.maps.DirectionsRenderer();
    var mapOptions = {
        center: new google.maps.LatLng(4.78, -74.05),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new window.google.maps.Map(document.getElementById("contenedorMapa"),
            mapOptions);
    directionsDisplay.setMap(map);
    GenerarRuta();
}

function GenerarRuta() {
    //listCoordenadas = [];
    var ciudadOrigen = $("[id*=txbCiudadOrigen]").value;
    //$("[id*=txbParada]")
    geocode(ciudadOrigen);
    var ciudadDestino = $("[id*=txbCiudadDestino]").value;
    geocode(ciudadDestino);

    var directionsService = new google.maps.DirectionsService();

    // carpool vias
    var rideWaypointsString = '';
    var rideWaypoints = new Array();
    $("[id*=txbParada]").each(function () {
        if ($(this).val() != '') {
            rideWaypoints.push({
                location: $(this).val(),
                stopover: true
            });
            geocode($(this).val());
            rideWaypointsString += $(this).val() + ',';
        }
    });


    directionRequest = {
        origin: ciudadOrigen,
        destination: ciudadDestino,
        waypoints: rideWaypoints,
        provideRouteAlternatives: false,
        travelMode: google.maps.TravelMode.DRIVING
    };

    directionsService.route(directionRequest, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
            rutaValida = true;
        } else {
            rutaValida = false;
            alert("Error creando la ruta de viaje");
        }
    });
}
