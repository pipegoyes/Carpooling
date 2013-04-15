$(document).ready(function () {
});

//funcion para mostrar el formulario de login
function lnkIniciaSesion_OnClientClick() {
    var lnkIniciaSesion = $('#lnkIniciaSesion');
    var divLogin = $('#divLoginFormFloat');
    var leftDivLogin = lnkIniciaSesion.offset().left - (divLogin.width() - lnkIniciaSesion.width());
    var topDivLogin = lnkIniciaSesion.offset().top + lnkIniciaSesion.height();
    $('#divLoginFormFloat').css('left', leftDivLogin);
    $('#divLoginFormFloat').css('top', topDivLogin);

    $('#divLoginFormFloat').toggle('blind', 500);
}