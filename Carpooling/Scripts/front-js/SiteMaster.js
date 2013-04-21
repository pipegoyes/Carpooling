$(document).ready(function () {
    //Evento click boton inicio sesion
    $("[ClientID='btnIniciarSesion']").click(function () {
        $('#hfdNombreUsuario').val($('#txbNombreUsuario').val());
        $('#hfdContrasenia').val($('#txbContrasenia').val());
    });
});

//para resuscribir los eventos de los controles dentro de updatepanel
pageRequestManager.add_endRequest(function () {
    $("[ClientID='btnIniciarSesion']").click(function () {
        $('#hfdNombreUsuario').val($('#txbNombreUsuario').val());
        $('#hfdContrasenia').val($('#txbContrasenia').val());
    });
});

//funcion para mostrar el formulario de login
function lnkIniciaSesion_OnClientClick() {
    var lnkIniciaSesion = $('#lnkIniciaSesion');
    var divLogin = $('#divLoginFormFloat');
    var leftDivLogin = lnkIniciaSesion.offset().left - (divLogin.width() - lnkIniciaSesion.width());
    //var topDivLogin = lnkIniciaSesion.offset().top + lnkIniciaSesion.height();
    var topDivLogin = 30 + lnkIniciaSesion.height();
    $('#divLoginFormFloat').css('left', leftDivLogin);
    $('#divLoginFormFloat').css('top', topDivLogin);
    $('#divLoginFormFloat').toggle('blind', 500);
}

//funcion para cambiar los valores de los hidden fields de nombre de usuario y contraseña
function btnIniciarSesion_OnClientClick() {
    $('#hfdNombreUsuario').val($('#txbNombreUsuario').val());
    $('#hfdContrasenia').val($('#txbContrasenia').val());
}