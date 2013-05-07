$(document).ready(function () {
    $("[id*=divOcultarSolicitudes]").click(function () {
        $("[id*=PanelSolicitudesDetalle]").slideUp("slow");
    });
});