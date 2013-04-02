$(document).ready(function () {
    

    //------Tarifa
    $( "[id*=txbTarifa]" ).spinner({
            min: 1000,
            max: 100000,
            step: 1000,
            start: 1000,
            numberFormat: "C"
    });

    //-----------Rol
    $("#roles").buttonset();

    //-----------FechaPArtida
    $("[id*=txbFechaPartida]").datepicker({
        showOn: "button",
        buttonImage: "/Styles/images/Calendar_scheduleHS.png",
        buttonImageOnly: true,
        minDate: 0, 
    });

    //----------Hora
//    $.widget("ui.timespinner", $.ui.spinner, {
//        options: {
//            // seconds
//            step: 60 * 1000,
//            // hours
//            page: 60
//        },

//        _parse: function (value) {
//            if (typeof value === "string") {
//                // already a timestamp
//                if (Number(value) == value) {
//                    return Number(value);
//                }
//                return +Globalize.parseDate(value);
//            }
//            return value;
//        },

//        _format: function (value) {
//            return Globalize.format(new Date(value), "t");
//        }
//    });
//    $('#<%:txbHora.ClientID%>').wijinputdate(
//        {
//            showSpinner: true,
//            dateFormat: "hh:mm tt"
//        }
//    );


    //------Cupos
    $("[id*=txbCupos]").spinner({
        spin: function (event, ui) {
            if (ui.value > 10) {
                $(this).spinner("value", 1);
                return false;
            } else if (ui.value < 1) {
                $(this).spinner("value", 10);
                return false;
            }
        }
    });
});