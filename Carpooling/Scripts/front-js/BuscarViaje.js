
$(document).ready(function () {

    $("[id*=calendarFechaViaje]").datepicker();
    $("[ClientID=btnBuscar]").button();

    var txtCiudadOrigen = document.getElementById("MainContent_txbCiudadOrigen"); //$("[id*=txbCiudadOrigen]").getElement();
    var txtCiudadDestino = document.getElementById("MainContent_txbCiudadDestino"); // $("[id*=txbCiudadDestino]").getElement();
    var options = {
        types: ['(cities)'],
        componentRestrictions: { country: "co" }
    };
    var autocompleteCiudadOrigen = new window.google.maps.places.Autocomplete(txtCiudadOrigen, options);
    var autocompleteCiudadDestino = new window.google.maps.places.Autocomplete(txtCiudadDestino, options);


    google.maps.event.addListener(autocompleteCiudadOrigen, 'place_changed', function () { });
    google.maps.event.addListener(autocompleteCiudadDestino, 'place_changed', function () { });
});
 

 //TODO esto hay q revisarlo con unos flags por ciudad
 function ValidarCiudadGM(idTxbCiudad)
 {
     var txtCiudadValidar = $("[id*=" + idTxbCiudad + "]");
     if(txtCiudadValidar!=null) {
         
     } else {
         alert("Error encontrando el campo:" + idTxbCiudad);
     }
 }

