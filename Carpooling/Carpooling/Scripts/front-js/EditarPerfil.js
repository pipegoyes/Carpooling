$(document).ready(function () {
    //Crea eventos para los controles
    $("[ClientID='ddlMesNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlAnioNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlDiaNacimiento']").change(CambiarDia);
});


function ObtenerDiasMes() {
    var ddlAnioNacimiento = $("[ClientID='ddlAnioNacimiento']");
    var ddlMesNacimiento = $("[ClientID='ddlMesNacimiento']");
    var ddlDiaNacimiento = $("[ClientID='ddlDiaNacimiento']");
    var hfDiaNacimiento = $("[ClientID='hfDiaNacimiento']");
    var fechaNacimiento = $("[ClientID='fechaNacimiento']");

    var json = {};
    json.pMes = ddlMesNacimiento.val();
    json.pAnio = ddlAnioNacimiento.val();

    if (ddlAnioNacimiento.val() != '-1' && ddlMesNacimiento.val() != '-1') {
        $.ajax({
            type: "POST",
            url: "/WebServices/SiteWebMethod.asmx/ObtenerDiasDdl",
            //url: "http://localwebmethods.com/WebServices/SiteWebMethod.asmx/ObtenerDiasDdl",
            data: JSON.stringify(json),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                if (response.d != null) {
                    ddlDiaNacimiento.empty();
                    ddlDiaNacimiento.append($('<option/>').attr('value', -1).text('Día'));
                    ddlDiaNacimiento.val('-1').attr('selected', true);
                    hfDiaNacimiento.val('-1');
                    ddlDiaNacimiento.attr('disabled', false);

                    var dias = response.d;
                    for (var i = 0; i < dias.length; i++)
                        ddlDiaNacimiento.append($('<option/>').attr('value', dias[i]).text(dias[i]));
                }
            },
            error: function (msg) {
                alert("La busqueda no se pudo realzar" + msg);
                return false;
            },
        });
    }
    else {
        ddlDiaNacimiento.empty();
        ddlDiaNacimiento.append($('<option/>').attr('value', -1).text('Día'));
        ddlDiaNacimiento.val('-1').attr('selected', true);
        ddlDiaNacimiento.attr('disabled', true);
    }
}

function CambiarDia() {
    var ddlDia = $("[ClientID='ddlDiaNacimiento']");
    var fechaNacimiento = $("[ClientID='fechaNacimiento']");
    var hfDiaNacimiento = $("[ClientID='hfDiaNacimiento']");
    hfDiaNacimiento.val(ddlDia.val());

    if (ddlDia.val() != "-1") {
        //fechaNacimiento.removeClass('errorValidacion');
    }
    else {
        //fechaNacimiento.addClass('errorValidacion');
    }
}