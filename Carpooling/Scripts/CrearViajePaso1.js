$(document).ready(function () {
    // Handler for .ready() called.
    initialize();
});

var geocoder;
var map;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

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
}


function BuscarCiudad() {

    var ciudadAddress = document.getElementById("MainContent_txbCiudadOrigen").value;
    //    var ciudadAddress = $('#txbCiudadOrigen').value;


    geocoder.geocode({ 'address': ciudadAddress }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

function GenerarRuta() {

    var ciudadOrigen = document.getElementById("MainContent_txbCiudadOrigen").value;
    var ciudadDestino = document.getElementById("MainContent_txbCiudadDestino").value;
    var directionsService = new google.maps.DirectionsService();

    var request = {
        origin: ciudadOrigen,
        destination: ciudadDestino,
        provideRouteAlternatives: false,
        travelMode: google.maps.TravelMode.DRIVING
        //        unitSystem: UnitSystem.IMPERIAL
    };

    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        }
    });

}