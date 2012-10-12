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