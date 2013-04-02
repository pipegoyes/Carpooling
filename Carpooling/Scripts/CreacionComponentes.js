//$(document).ready(function() {


//    //------Tarifa
//    $("[id*=txbTarifa]").spinner({
//        min: 1000,
//        max: 100000,
//        step: 1000,
//        start: 1000,
//        numberFormat: "C"
//    });

//    //-----------Rol
//    $("#roles").buttonset();

//    //-----------FechaPArtida
//    $("[id*=txbFechaPartida]").datepicker({
//        showOn: "button",
//        buttonImage: "/Styles/images/Calendar_scheduleHS.png",
//        buttonImageOnly: true,
//        minDate: 0
//    });

//    //------Hora
//    $('#<%:txbHora.ClientID%>').wijinputdate(
//        {
//            showSpinner: true,
//            dateFormat: "hh:mm tt"
//        }
//    );


//    //------Cupos
//    $("[id*=txbCupos]").spinner({
//        spin: function(event, ui) {
//            if (ui.value > 10) {
//                $(this).spinner("value", 1);
//                return false;
//            } else if (ui.value < 1) {
//                $(this).spinner("value", 10);
//                return false;
//            }
//        }
//    });
//});