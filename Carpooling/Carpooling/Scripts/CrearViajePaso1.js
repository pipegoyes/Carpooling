﻿$(document).ready(function () {
    //Cargar el mapa cuando se hayan cargado todos los componentes de la pagina
    initialize();
    
    $("[id*=btnSiguientePaso]").click(function () {
        if ($("[id*=txbCiudadOrigen]").val() == '') {
            alert("Debe ingresar una ciudad de origen!");
        } else if ($("[id*=txbCiudadDestino]").val() == '') {
            alert("Debe ingresar una ciudad de destino!");
        } else {
            $("[id*=divInfoPaso2]").empty();
            llenarInfoPaso2();
            $("[id*=divPaso1]").slideToggle(1000, null);
            $("[id*=divPaso2]").fadeIn("slow", null);
        }
    });

    $("[id*=btnAtras]").click(function () {
        $("[id*=divPaso1]").slideToggle(1000, null);
        $("[id*=divPaso2]").fadeOut("slow", null);

    });

    var jsonEnvio = {};
    jsonEnvio.origin = "BOgota";
    jsonEnvio.destination = "Cali";

});

function publicarViaje() {
    var jsonViaje = {};
    jsonViaje.origin = directionRequest.origin;
    jsonViaje.destination = directionRequest.destination;
    jsonViaje.wayPoints = directionRequest.waypoints;
    jsonViaje.tarifa = $("[id*=txbTarifa]").val();
    jsonViaje.cupos = $("[id*=txbCupos]").val();
    jsonViaje.fechaPartida = $("[id*=txbFechaPartida]").val();
    jsonViaje.rol = true;

    $.ajax({
        type: "POST",
        url: "CrearViajePaso1.aspx/PublicarViajeAsynch",
        data: JSON.stringify({ request: jsonViaje }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            //            createDikv("divContMensaje", nombreDiv, null, "divCargando");
        },
        complete: function () {
            //            alert("Publicacion Exitosa");
        },
        error: function () {
            
            return false;
        },
        async: false,
        success: function (result) {
            // Do something interesting here.
            //---Mensjae exitoso
            $("#dialog-message").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

    });

}

function llenarInfoPaso2() {
    $("<div />", {id: "divCiudadOrigenLbl"})
        .append($("<span />", { "class": "label"}).text = "Ciudad origen: ")
        .append($("<span />", { id: "lblCiudadOrigen" }).text = $("[id*=txbCiudadOrigen]").val())
        .appendTo("#divInfoPaso2");
    $("[id*=txbParada]").each(function () {
        if ($(this).val() != '') {
            $("<div />", { })
                .append($("<span />", { }).text = "Parada: ")
                .append($("<span />", { }).text = $(this).val())
                .appendTo("#divInfoPaso2");
        }

    });



    $("<div />", { id: "divCiudadDestinoLbl"})
        .append($("<span />", { "class": "label" }).text = "Ciudad destino: ")
        .append($("<span />", { id: "lblCiudadDestino" }).text = $("[id*=txbCiudadDestino]").val())
        .appendTo("#divInfoPaso2");
}

var directionsDisplay;
var map;
var directionsService = new google.maps.DirectionsService();
var directionRequest;

function CrearParada() {
    var divContenedor = $("[id*=contenedorParadas]").first();
    var i = document.getElementById("contenedorParadas").childNodes.length;
    var paradaNombre = "txbParada" + i;
    $("<div />", { "class": "parada", id: "divParada" + i })
        .append($("<span />", { "class":"labelParada",ID: "label" + i }).text ="Parada"+i)
        .append($("<input />", { type: "text", id: paradaNombre }))
    //TODO pendiente por el boton de eliminar parada
//        .append($("<div />", { "class": "btnEliminar", id: "btnEliminar" + i }))
        .appendTo("#contenedorParadas");
    autocompletar(paradaNombre);
}

function autocompletar(paradaNombre) {
    var input = document.getElementById(paradaNombre);
    var autocomplete = new google.maps.places.Autocomplete(input);
//    google.maps.event.addListener(autocomplete, 'place_changed', function () {
//    });
}


function initialize() {

    directionsDisplay = new window.google.maps.DirectionsRenderer();
    
    var bogota = new google.maps.LatLng(4.78, -74.05);
    var mapOptions = {
        center: bogota,
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("contenedorMapa"), mapOptions);
    
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

    // carpool vias
    var rideWaypointsString = '';
    var rideWaypoints = new Array();
    $("[id*=txbParada]").each(function () {
        if ($(this).val() != '') {
            rideWaypoints.push({
                location: $(this).val(),
                stopover: true
            });
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
        } else {
            alert("Error creando la ruta de viaje");
        }
    });
}
