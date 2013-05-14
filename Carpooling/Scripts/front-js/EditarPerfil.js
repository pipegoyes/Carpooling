$(document).ready(function () {
    //Crea eventos para los controles
    $("[ClientID='ddlMesNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlAnioNacimiento']").change(ObtenerDiasMes);
    $("[ClientID='ddlDiaNacimiento']").change(CambiarDia);
    $("[ClientID='rblGenero'] input").change(CambioGenero);

    InicializarImagenCuenta();
    CrearPopupCambioImagen();
});


function ObtenerDiasMes() {
    var ddlAnioNacimiento = $("[ClientID='ddlAnioNacimiento']");
    var ddlMesNacimiento = $("[ClientID='ddlMesNacimiento']");
    var ddlDiaNacimiento = $("[ClientID='ddlDiaNacimiento']");
    var hfDiaNacimiento = $('#hfDiaNacimiento');
    var fechaNacimiento = $("[ClientID='fechaNacimiento']");

    var json = {};
    json.pMes = ddlMesNacimiento.val();
    json.pAnio = ddlAnioNacimiento.val();

    if (ddlAnioNacimiento.val() != '-1' && ddlMesNacimiento.val() != '-1') {
        $.ajax({
            type: "POST",
            url: "/WebServices/SiteWebMethod.asmx/ObtenerDiasDdl",
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
    var hfDiaNacimiento = $('#hfDiaNacimiento');
    hfDiaNacimiento.val(ddlDia.val());

    if (ddlDia.val() != "-1") {
        //fechaNacimiento.removeClass('errorValidacion');
    }
    else {
        //fechaNacimiento.addClass('errorValidacion');
    }
}


function CrearPopupCambioImagen() {
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
        }
    });
}


function CrearUploader() {
    $('#fine-uploader').fineUploader({
        request: {
            endpoint: 'FilesUploader.html',
            params: {
                idUsuario: $("[ClientID='txbIdUsuario']").val()
            }
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
            $("#imagenFotoModal").attr("src", "/Styles/images/ajax_loader.gif?" + new Date().getTime());
        })
        .on('complete', function (event, id, filename, responseJSON) {
            if (responseJSON.success) {
                $("#imagenFotoModal").attr("src", responseJSON.userImage + "?" + new Date().getTime());
            }
        });

    $('.qq-upload-button').attr('id', 'btnSeleccionarImagen');
    $('.qq-upload-button').css('line-height', '30px');
    $('#btnSeleccionarImagen').width(90);
    $('#btnSeleccionarImagen').height(29);
    $('#btnSeleccionarImagen').removeClass('qq-upload-button qq-upload-button-hover qq-upload-button-focus');
    $('#btnSeleccionarImagen').addClass('button-gradient blue');

    $(":input[type='file']").hover(
        function () {
            $('#btnSeleccionarImagen').removeClass('ui-state-default qq-upload-button-hover ui-state-active qq-upload-button-focus');
            $('#btnSeleccionarImagen').addClass('button-gradient blue');
        },
        function () {
            $('#btnSeleccionarImagen').removeClass('ui-state-hover  qq-upload-button-hover ui-state-active qq-upload-button-focus');
            $('#btnSeleccionarImagen').addClass('button-gradient blue');
        }
    );

    $(":input[type='file']").mouseup(function () {
        $('#btnSeleccionarImagen').removeClass('ui-state-active qq-upload-button-focus');
    }).mousedown(function () {
        $('#btnSeleccionarImagen').removeClass('qq-upload-button-focus');
        $('#btnSeleccionarImagen').addClass('button-gradient blue');
    });
}


function InicializarImagenCuenta(){
    $("#hfdImagePath").val($("[ClientID='imgImagenCuenta']").attr("src"));  
}

function CambioGenero() {
    var rutaImagen = $("#hfdImagePath").val();
    var rutaImagenHombre = $('#hfdImagePathHombre').val();
    var rutaImagenMujer = $('#hfdImagePathMujer').val();

    rutaImagen = rutaImagen.substring(rutaImagen.lastIndexOf('/')+1, rutaImagen.length);
    rutaImagenHombre = rutaImagenHombre.substring(rutaImagenHombre.lastIndexOf('/')+1, rutaImagenHombre.length); 
    rutaImagenMujer = rutaImagenMujer.substring(rutaImagenMujer.lastIndexOf('/')+1, rutaImagenMujer.length);

    if (rutaImagen == rutaImagenHombre || rutaImagen == rutaImagenMujer) {        
        if ($("[ClientID='rblGenero'] input:checked").val() == 'H') {
            $("[ClientID='imgImagenCuenta']").attr("src", $('#hfdImagePathHombre').val().replace('~', ''));
        }
        else {
            $("[ClientID='imgImagenCuenta']").attr("src", $('#hfdImagePathMujer').val().replace('~', ''));
        }
        $("#hfdImagePath").val($("[ClientID='imgImagenCuenta']").attr("src"));
    }
}

function lnkCambiarFoto_OnClick() {
    $("#imagenFotoModal").attr("src", $("[ClientID='imgImagenCuenta']").attr("src") + "?" + new Date().getTime());
    $('#dialogoCambiarFoto').wijdialog('open');
}

//funcion que se ejecuta al aceptar el cuadro modal de cargar imagen
function onOk_ImageUserModalPopup() {
    $("#hfdImagePath").val($("#imagenFotoModal").attr("src"));
    $("[ClientID='imgImagenCuenta']").attr("src", $("#hfdImagePath").val() + "?" + new Date().getTime())
    $('#dialogoCambiarFoto').wijdialog('close');
}

//funcion que se ejecuta al cancelar el cuadro modal de cargar imagen
function onCancel_ImageUserModalPopup() {
    $('#dialogoCambiarFoto').wijdialog('close');
}

//funcion que se ejecuta con el click en el boton quitar imagen del popup modal de cambiar imagen
function BtnQuitarImagen_OnClick() {
    var imagenFotoModal = $("#imagenFotoModal");
    if ($("[ClientID='rblGenero'] input:checked").val() == 'H') {
        imagenFotoModal.attr('src', $('#hfdImagePathHombre').val().replace('~', '') + "?" + new Date().getTime());
    }
    else {
        imagenFotoModal.attr('src', $('#hfdImagePathMujer').val().replace('~', '') + "?" + new Date().getTime());
    }
}
