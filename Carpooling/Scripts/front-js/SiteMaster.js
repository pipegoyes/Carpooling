/**********************************FUNCIONES JS***********************************/
//funcion para mostrar el formulario de login
function lnkIniciaSesion_OnClientClick() {
    var lnkIniciaSesion = $('#lnkIniciaSesion');
    var divLogin = $('#divLoginFormFloat');
    var leftDivLogin = lnkIniciaSesion.offset().left - (divLogin.width() - lnkIniciaSesion.width());
    //var topDivLogin = lnkIniciaSesion.offset().top + lnkIniciaSesion.height();
    var topDivLogin = 30 + lnkIniciaSesion.height();
    $('#divLoginFormFloat').css('left', leftDivLogin);
    $('#divLoginFormFloat').css('top', topDivLogin);

    var errorDiv = $('#errorLoging');
    var errorMsg = $('#lblMensajeError');
    errorMsg.text('');
    errorDiv.css('display', 'none');

    $('#divLoginFormFloat').toggle('blind', 500);
    return false;
}

//funcion para cambiar los valores de los hidden fields de nombre de usuario y contraseña
function btnIniciarSesion_OnClientClick() {
    $('#hfdNombreUsuario').val($('#txbNombreUsuario').val());
    $('#hfdContrasenia').val($('#txbContrasenia').val());
}


/*******************************EVENTOS JQUERY**********************************/
//evento al terminar la carga del documento
$(document).ready(function () {
    $("[ClientID='btnIniciarSesion']").click(function () {
        btnIniciarSesion_OnClientClick();
    });

    $('#lnkIniciaSesion').click(function () {
        lnkIniciaSesion_OnClientClick();
    });
});

//$(window).load(function () {

//});