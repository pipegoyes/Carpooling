//#region CREACION CONTROLES

$(document).ready(function () {
    //Aplica los estilos del tema al terminar de cargar la pagina
    AplicarCCS();

    //Crea eventos para los controles
    $("[ClientID='ddlMesNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlAnioNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlDiaNacimiento']").change(CambiarDia);
});

function CrearUploader() {
    $('#fine-uploader').fineUploader({
        request: {
            endpoint: 'FilesUploader.html'
        },
        text: {
            uploadButton: 'Buscar',
            failUpload: 'Falló la subida de la imagen.',
            dragZone: 'Arrastra la imagen para subirla'
        },
        failedUploadTextDisplay: {
            mode: 'none'
        },
        multiple: false,
        acceptFiles: 'image/*',
        validation: {
            allowedExtensions: ['jpeg', 'jpg', 'png', 'gif'],
            sizeLimit: 102400000 // 50 kB = 50 * 1024 bytes
        },
        disableCancelForFormUploads: true,
        disableDefaultDropzone: true,
        template: '<div class="qq-uploader">' +
            '<pre class="qq-upload-drop-area" style="display= none;"><span>{dragZoneText}</span></pre>' +
            '<div class="qq-upload-button ui-button" style="width: auto;">{uploadButtonText}</div>' +
            '<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;"></ul>' +
            '</div>',
        classes: {
            success: 'alert alert-success',
            fail: 'alert alert-error'
        },
        debug: true
    })
        .on('progress', function (event, id, filename, uploadedBytes, totalBytes) {
            $("#imagenFotoModal").attr("src", "/Styles/images/ajax_loader.gif");
        })
        .on('complete', function (event, id, filename, responseJSON) {
            if (responseJSON.success) {
                $("#imagenFotoModal").attr("src", responseJSON.userImage);
                $('#hfdImagePath').attr("value", responseJSON.userImage);
            }
        });

    $('.qq-upload-button').attr('id', 'btnSeleccionarImagen');
    $('.qq-upload-button').css('line-height', '30px');
    $('#btnSeleccionarImagen').width(90);
    $('#btnSeleccionarImagen').height(29);
    $('#btnSeleccionarImagen').removeClass('qq-upload-button qq-upload-button-hover qq-upload-button-focus');
    $('#btnSeleccionarImagen').addClass('ui-button ui-widget ui-state-default ui-button-text-only ui-corner-all');

    $(":input[type='file']").hover(
        function () {
            $('#btnSeleccionarImagen').removeClass('ui-state-default qq-upload-button-hover ui-state-active qq-upload-button-focus');
            $('#btnSeleccionarImagen').addClass('ui-state-hover');
        },
        function () {
            $('#btnSeleccionarImagen').removeClass('ui-state-hover  qq-upload-button-hover ui-state-active qq-upload-button-focus');
            $('#btnSeleccionarImagen').addClass('ui-state-default');
        }
    );

    $(":input[type='file']").mouseup(function () {
        $('#btnSeleccionarImagen').removeClass('ui-state-active qq-upload-button-focus');
    }).mousedown(function () {
        $('#btnSeleccionarImagen').removeClass('qq-upload-button-focus');
        $('#btnSeleccionarImagen').addClass('ui-state-active');
    });
}

function AplicarCCS() {
    //aplica estilos jquery ui los controles
    //$(":input[type='text'],:input[type='password'],textarea").wijtextbox();
    $("#btnAceptarImagen").button();
    $('#btnQuitarImagen').button();
    $('#btnIrPaso2Adelante').button();
    $('#btnIrPaso1Atras').button();
    $('#btnIrPaso3Adelante').button();
    $('#btnIrPaso2Atras').button();
    $("[ClientID='btnFinalizar']").button();
    $("[ClientID='ddlOcupacion']").wijdropdown();
    $("#genero_usuario").buttonset();
    $("#caracteristicas_usuarios").buttonset();

    //Creacion de controles especiales
    //$("[ClientID='txtFechaNacimiento']").wijinputdate({ dateFormat: 'D', culture: 'es', showTrigger: true });

    $("#dialogoCambiarFoto").wijdialog({
        autoOpen: false,
        resizable: false,
        height: 287,
        width: 360,
        modal: true,
        captionButtons: {
            pin: { visible: false }, refresh: { visible: false }, toggle: { visible: false }, minimize: { visible: false }, maximize: { visible: false },
            close: {
                visible: true,
                click: function () { onCancel_ImageUserModalPopup(); }
            }
        },
        open: function (e) {
            CrearUploader();
        },
        create: function (e) {
            $("#imgFoto").attr("src", $("#imagenFotoModal").attr("src"));
        }
    });

    $("#pagesWizard").wijwizard({
        backBtnText: 'Atras',
        nextBtnText: 'Continue',
        navButtons: 'none'
    });

}

//#endregion CREACION CONTROLES

//#region FUNCIONES AJAX CARGAR DATOS CONTROLES

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
            url: "RegistroUsuario.aspx/ObtenerDiasDdl",
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
        fechaNacimiento.removeClass('errorValidacion');        
    }
    else {
        fechaNacimiento.addClass('errorValidacion');
    }
        
}

//#endregion FUNCIONES AJAX CONTROLES

//#region FUNCIONES CONTROL POPUP CAMBIO IMAGEN

//#region VARIABLES GLOBALES PARA EL CAMBIO DE IMAGEN

//Manejo del cambio de imagen del usuario
var pathImagen;

//#endregion VARIABLES GLOBALES PARA EL CAMBIO DE IMAGEN

function lnkCambiarFoto_OnClick() {
    pathImagen = $("#hfdImagePath").attr("value");
    $("#imagenFotoModal").attr("src", $("#imgFoto").attr("src"));
    $('#dialogoCambiarFoto').wijdialog('open');
    //$("#imgFoto").attr("src", $("#imagenFotoModal").attr("src"));
}

//funcion que se ejecuta al aceptar el cuadro modal de cargar imagen
function onOk_ImageUserModalPopup() {
    var imageUserPath = $("#hfdImagePath").attr("value");
    if (imageUserPath != "") {
        $("#imgFoto").attr("src", imageUserPath);
        pathImagen = imageUserPath;
    }
    $('#dialogoCambiarFoto').wijdialog('close');
}

//funcion que se ejecuta al cancelar el cuadro modal de cargar imagen
function onCancel_ImageUserModalPopup() {
    $("#hfdImagePath").attr("value", pathImagen);
    $("#imagenFotoModal").attr("src", $("#imgFoto").attr("src"));
    $('#dialogoCambiarFoto').wijdialog('close');
}

//funcion que se ejecuta con el click en el boton quitar imagen del popup modal de cambiar imagen
function BtnQuitarImagen_OnClick() {
    $("#imagenFotoModal").attr("src", "/Styles/images/imgFotoPerfilHombre.jpg");
    $("#hfdImagePath").attr("value", "/Styles/images/imgFotoPerfilHombre.jpg");
}

//#endregion FUNCIONES CONTROL POPUP CAMBIO IMAGEN

//#region VALIDACIONES WIZARD REGISTRO USUARIO

//funciones de validacion y desplazamiento del wizard
function WizardValidacion(paso) {
    if (Page_ClientValidate('ValidacionPaso' + paso + '')) {
        if (paso < 3)
            $("#pagesWizard").wijwizard("next");
    }
}

function WizardPaso(paso) {
    $("#pagesWizard").wijwizard("show", (paso - 1));
}

//funcion que validad la fecha de nacimiento
function ValidarFechaNacimiento(sender, args) {

    var ddlAnio = $("[ClientID='ddlAnioNacimiento']");
    var ddlMes = $("[ClientID='ddlMesNacimiento']");
    var ddlDia = $("[ClientID='ddlDiaNacimiento']");
    var fechaNacimiento = $("[ClientID='fechaNacimiento']");

    if (ddlMes.val() == "-1" || ddlDia.val() == "-1" || ddlAnio.val() == "-1") {
    //if (ddlDia.val() == "-1") {
        args.IsValid = false;
        fechaNacimiento.addClass('errorValidacion');
        //ddlMes.addClass('errorValidacion');
        //ddlDia.addClass('errorValidacion');
    }
    else {
        args.IsValid = true;
        //ddlAnio.removeClass('errorValidacion');
        //ddlMes.removeClass('errorValidacion');
        fechaNacimiento.removeClass('errorValidacion');
    }
}

//#endregion VALIDACIONES WIZARD REGISTRO USUARIO



