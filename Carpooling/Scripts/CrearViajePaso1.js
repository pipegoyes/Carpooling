$(document).ready(function () {
    //Cargar el mapa cuando se hayan cargado todos los componentes de la pagina
    initialize();
});

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
//var map;



function initialize() {

    directionsDisplay = new window.google.maps.DirectionsRenderer();
    
    var bogota = new google.maps.LatLng(4.78, -74.05);
    var mapOptions = {
        center: bogota,
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("contenedorMapa"),mapOptions);
//    var input = $("[id*=txbCiudadOrigen]");
    
    var input = document.getElementById("MainContent_txbCiudadOrigen");
    var autocomplete = new google.maps.places.Autocomplete(input);
    
    var ciudadDestino = document.getElementById("MainContent_txbCiudadDestino");
    var autocompleteCiudadDestino = new google.maps.places.Autocomplete(ciudadDestino);
    
    autocomplete.bindTo('bounds', map);

    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map
    });

    autocompleteCiudadDestino.bindTo('bounds', map);
    google.maps.event.addListener(autocompleteCiudadDestino, 'place_changed', function () {
        //        alert("funciona");
        GenerarRuta();
    });

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        infowindow.close();
        marker.setVisible(false);
        input.className = '';
        var place = autocomplete.getPlace();
        
        if (!place.geometry) {
            // Inform the user that the place was not found and return.
            input.className = 'notfound';
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        var image = new google.maps.MarkerImage(
              place.icon,
              new google.maps.Size(71, 71),
              new google.maps.Point(0, 0),
              new google.maps.Point(17, 34),
              new google.maps.Size(35, 35));
        marker.setIcon(image);
        marker.setPosition(place.geometry.location);

        var address = '';
        if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);
    });
    directionsDisplay.setMap(map);
}

function BuscarCiudad() {

    var ciudadAddress = document.getElementById("MainContent_txbCiudadOrigen").value;

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
    var parada1 = $('[id*=txbParada1]').val();  
    var parada2 = $('[id*=txbParada2]').val();  
    var directionRequest = {
        origin: ciudadOrigen,
        destination: ciudadDestino,
//        waypoints: [
//            {
//                location: parada1,
//                stopover: false
//            }, {
//                location: parada2,
//                stopover:false
//            }],
        provideRouteAlternatives: false,
        travelMode: google.maps.TravelMode.DRIVING
    };

    directionsService.route(directionRequest, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        } else {
            alert("Error creando la ruta de viaje");
        }
    });
}

//function autocompleteCity() {
//    var texto = $("[id*=txbPrueba]").val();
//    var key = "AIzaSyC - _VdOgJeuq0exLR38Un_LoM5DilB_1_0";
//    
//    if(texto.length>3) {
//        var url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=" + texto + "&types=geocode&language=fr&sensor=false&key=" + key;
//        $.ajax({
//            type: "GET",
//            url: url,
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: function (msg) {
//                alert("Successful");
//            },
//            error: function (msg) {
//                alert("Failed");
//            }
//        });    
//    }
//}

