<%@ Page Title="" Language="C#" MasterPageFile="/Front/Site.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="NuevaCuenta.aspx.cs" Inherits="Carpooling.Front.Cuentas.NuevaCuenta" %>
<%--<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>--%>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />
<%--    <link href="/Styles/jquery.wijmo-complete.2.2.1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/jquery.wijmo-open.2.2.1.css" rel="stylesheet" type="text/css"/>--%>
    <link href="/Styles/fineuploader.css" rel="stylesheet" />

<%--    <script src="/Scripts/jquery.wijmo/jquery.wijmo-complete.all.2.2.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.wijmo/jquery.wijmo-open.all.2.2.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.wijmo/globalize.cultures.js"></script>--%>
    <script src="/Scripts/jquery.fineuploader/jquery.fineuploader-3.0.js"></script>

    <%--<script src="Scripts/jquery.fineuploader/fileuploader.js"></script>--%>

<%-- Desactiva el control que hace el ajax postback --%>    
<%--<script type="text/javascript">
    var pbControl = null;
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        pbControl = args.get_postBackElement();  //the control causing the postback 
        pbControl.disabled = true;
    }
    function EndRequestHandler(sender, args) {
        pbControl.disabled = false;
        pbControl = null;
    }
</script>--%>
    
<%--    //funcion que se ejecuta al cancelar el cuadro modal de cargar imagen
    function onCancel_ImageUserModalPopup() {
        var modalCambiarFoto = '<%= lnkCambiarFoto_ModalPopupExtender.ClientID %>';
        var pnl = '<%= pnlModalCargarImagen.ClientID %>';
        
        window.$find(pnl).css("display","none");
        window.$find(modalCambiarFoto).hide();
    }--%>

<script type="text/javascript">
    $(function() {
        //Desactiva DDL
        //$('#<%:ddlPais.ClientID%>').change(ObtenerDepartamentos);
        //$('#<%:ddlDepartamento.ClientID%>').append($('<option/>').attr('value', '0').text(' -- Seleccione un departamento -- '));
        //$('#<%:ddlCiudad.ClientID%>').append($('<option/>').attr('value', '0').text(' -- Seleccione una ciudad -- '));
        //$('#<%:ddlDepartamento.ClientID%>').attr('disabled', true);
        //$('#<%:ddlCiudad.ClientID%>').attr('disabled', true);
    });

    $(document).ready(function() {
        //Aplica los estilos del tema al terminar de cargar la pagina
        AplicarCCS();       
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
        }).on('complete', function (event, id, filename, responseJSON) {
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
        //Creacion de controles especiales
        $(":input[type='text'],:input[type='password'],textarea").wijtextbox();
        $("#btnAceptarImagen").button();
        $('#btnQuitarImagen').button();
                 
        $('#<%:btnSiguiente.ClientID%>').button(); 
        $('#<%:btnAtras1.ClientID%>').button(); 
        $('#<%:btnSiguiente1.ClientID%>').button(); 
        $('#<%:btnAtras2.ClientID%>').button(); 
        $('#<%:btnFinalizar.ClientID%>').button(); 

        $('#<%:ddlOcupacion.ClientID%>').wijdropdown(); 
        //$('#<%:ddlPais.ClientID%>').wijdropdown(); 
        //$('#<%:ddlDepartamento.ClientID%>').wijdropdown(); 
        //$('#<%:ddlCiudad.ClientID%>').wijdropdown(); 

        $('#<%:txtFechaNacimiento.ClientID%>').wijinputdate({ dateFormat: 'D', culture: 'es', showTrigger: true }); 
               
        $("#genero_usuario").buttonset();
        $("#caracteristicas_usuarios").buttonset();
        
        $("#dialogoCambiarFoto").wijdialog({ 
            autoOpen: false, 
            resizable: false, 
            height: 287, 
            width: 360, 
            modal: true,
            captionButtons: {
                pin: { visible: false}, refresh: { visible: false}, toggle: { visible: false}, minimize: { visible: false}, maximize: { visible: false},
                close: {
                    visible: true,
                    click: function () { onCancel_ImageUserModalPopup();}
                }
            },
            open: function (e) {
                CrearUploader();
            },
            create: function (e) {
                $("#imgFoto").attr("src", $("#imagenFotoModal").attr("src"));
            }
        }); 
    }
    
    //funciones para cargar datos a los listas desplegables
    function ObtenerDepartamentos() {
        var json = {};
        json.pPais = $('#<%:ddlPais.ClientID%>').val();
        
        $.ajax({
            type: "POST",
            url: "NuevaCuenta.aspx/ObtenerDepartamentos",
            data: JSON.stringify(json),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            beforeSend: function () {
                $('#<%:ddlDepartamento.ClientID%>').empty();
                $('#<%:ddlDepartamento.ClientID%>').append($('<option/>').attr('value', '0').text('Cargando departamentos...'));
            },
            success: function (results) {
                $('#<%:ddlDepartamento.ClientID%>').empty();
                if (results.d != null) {                    
                    var departamentos = results.d;
                    $('#<%:ddlDepartamento.ClientID%>').attr('disabled', false).change(ObtenerCiudades);
                    $('#<%:ddlDepartamento.ClientID%>').append($('<option/>').attr('value', '0').text(' -- Seleccione un departamento -- '));
                    $('#<%:ddlCiudad.ClientID%>').attr('disabled', true);
                    for (var i = 0; i < departamentos.length; i++)      
                        $('#<%:ddlDepartamento.ClientID%>').append($('<option/>').attr('value', departamentos[i].Valor).text(departamentos[i].Dato));                    
                } else {
                    $('#<%:ddlDepartamento.ClientID%>').append($('<option/>').attr('value', '0').text(' -- Seleccione un departamento -- '));
                    $('#<%:ddlDepartamento.ClientID%>').attr('disabled', true);
                }
            },
            error: function () {
                alert("La busqueda no se pudo realzar");
                return false;
            },
        });
    }
    
    function ObtenerCiudades() {
        $.ajax({
            type: "POST",
            url: "ObtenerCiudades",
            data: "{departamento: '" + $('#<%:ddlDepartamento.ClientID%>').val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d != null) {
                    var ciudades = response.d;
                    $('#<%:ddlCiudad.ClientID%>').attr('disabled', false).removeOption(/./).addOption('', ' -- Seleccione una ciudad -- ');
                    for (var i = 0; i < ciudades.length; i++) {
                        var val = ciudades[i].Valor;
                        var text = ciudades[i].Dato;
                        $('#<%:ddlCiudad.ClientID%>').addOption(val, text, false);
                    }
                }
            }
        });
    }



    //Manejo del cambio de imagen del usuario
    var pathImagen;
    
    function lnkCambiarFoto_OnClick() {        
        pathImagen = $("#hfdImagePath").attr("value");
        $("#imagenFotoModal").attr("src", $("#imgFoto").attr("src"));
        $('#dialogoCambiarFoto').wijdialog('open');
        $("#imgFoto").attr("src", $("#imagenFotoModal").attr("src"));
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
    
    //muestra la animacion de cuando se carga la foto del perfil
    function onClientUploadStared(sender, e) {
        $("#imgFotoModal").attr("src", "/Styles/images/ajax_loader.gif");
    }
</script>    
      
</asp:Content>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Home Page.</h1>
                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>
            <p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       
    <input id="hfdImagePath" type="hidden" name="hfdImagePath" value="/Styles/images/imgFotoPerfilHombre.jpg"/>      
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>        

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnPreRender="UpdatePanel1_PreRender">
        <ContentTemplate>
               
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
                <asp:View ID="View1" runat="server">
                       
                    <div id="titulo1" class="ui-widget-header ui-corner-all tituloBox">
                        <img src="/Styles/images/orderedList1.png" alt="" class="float-left"/>
                        <span class="tituloFont">Información de la cuenta</span>
                        <img src="/Styles/images/orderedList3.png" alt="" class="float-right"/>
                        <img src="/Styles/images/orderedList2.png" alt="" class="float-right"/>
                    </div>
                                                              
                    <div class="contenidoBox">
                        
                        <div class="clear-fix">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Nombre de usuario:</label>
                                <asp:TextBox ID="txtNombreUsuario" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNombreUsuario_Validation1" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="El nombre de usuario es requerido" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC1" runat="server" TargetControlID="txtNombreUsuario_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtNombreUsuario_Validation2" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="El nombre de usuario debe tener entre 8 a 50 caracteres" ValidationExpression="^\S{7,49}$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC2" runat="server" TargetControlID="txtNombreUsuario_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtNombreUsuario_Validation3" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="El formato del nombre de usuario proporcionando no es valido" ValidationExpression="^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC3" runat="server" TargetControlID="txtNombreUsuario_Validation3" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>                                
                            </div>
                        </div>
                        
                        <div class="clear-fix-margin-top">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Correo electronico:</label>
                                <asp:TextBox ID="txtCorreoElectronico" runat="server"></asp:TextBox>                                    
                                <asp:RequiredFieldValidator ID="txtCorreoElectronico_Validation1" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="El correo electronico es requerido" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtCorreoElectronico_VC1" runat="server" TargetControlID="txtCorreoElectronico_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtCorreoElectronico_Validation2" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="El formato del correo electronico proporcionado no es valido" ValidationExpression="^[a-z][\w\.]+@([\w\-]+\.)+[a-z]{2,7}$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtCorreoElectronico_VC2" runat="server" TargetControlID="txtCorreoElectronico_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>                                
                            </div>                            
                            <div class="float-left columna-x2 columna-x2-right">
                                <label>Confirme el correo electronico:</label>                                       
                                <asp:TextBox ID="txtReCorreoElectronico" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtReCorreoElectronico_Validation1" runat="server" ControlToValidate="txtReCorreoElectronico" ErrorMessage="La confirmación del correo electronico es requerida" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReCorreoElectronico_VC1" runat="server" TargetControlID="txtReCorreoElectronico_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtReCorreoElectronico_Validation2" runat="server" ControlToValidate="txtReCorreoElectronico" ErrorMessage="El formato del correo electronico proporcionado no es valido" ValidationExpression="^[a-z][\w\.]+@([\w\-]+\.)+[a-z]{2,7}$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReCorreoElectronico_VC2" runat="server" TargetControlID="txtReCorreoElectronico_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:CompareValidator ID="txtReCorreoElectronico_Validation3" runat="server" ControlToValidate="txtReCorreoElectronico" ControlToCompare="txtCorreoElectronico"  ErrorMessage="La confirmación del correo electronico no coincide" Display="None"></asp:CompareValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReCorreoElectronico_VC3" runat="server" TargetControlID="txtReCorreoElectronico_Validation3" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                            </div>                           
                        </div>    
                        
                        <div class="clear-fix-margin-top">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Contraseña:</label>
                                <asp:TextBox ID="txtContrasena" runat="server" type="password"></asp:TextBox>                                    
                                <asp:RequiredFieldValidator ID="txtContrasena_Validation1" runat="server" ControlToValidate="txtContrasena" ErrorMessage="La constraseña es requerida" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC1" runat="server" TargetControlID="txtContrasena_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtContrasena_Validation2" runat="server" ControlToValidate="txtContrasena" ErrorMessage="El formato de la contraseña no es valido" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC2" runat="server" TargetControlID="txtContrasena_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>                                
                            </div>                            
                            <div class="float-left columna-x2 columna-x2-right">
                                <label>Confirme la contraseña:</label>
                                <asp:TextBox ID="txtReContrasena" runat="server" type="password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtReContrasena_Validator1" runat="server" ControlToValidate="txtReContrasena" ErrorMessage="La confirmación de la constraseña es requerida" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC1" runat="server" TargetControlID="txtReContrasena_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="txtReContrasena_Validator2" runat="server" ControlToValidate="txtReContrasena" ErrorMessage="El formato de la contraseña no es valido" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$" Display="None"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC2" runat="server" TargetControlID="txtReContrasena_Validator2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                                <asp:CompareValidator ID="txtReContrasena_Validator3" runat="server" ControlToValidate="txtReContrasena" ControlToCompare="txtContrasena"  ErrorMessage="La confirmación de la contraseña no coincide" Display="None"></asp:CompareValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC3" runat="server" TargetControlID="txtReContrasena_Validator3" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>                                
                            </div>                          
                        </div>    
          
                    </div>

                    <div class="botonesBox">
                            <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" OnClick="btnSiguiente_Click" />                
                    </div>

                </asp:View>
         
                <asp:View ID="View2" runat="server">
                
                    <div id="titulo2" class="ui-widget-header ui-corner-all tituloBox">
                        <img src="/Styles/images/orderedList1.png" alt="" class="float-left"/>
                        <img src="/Styles/images/orderedList2.png" alt="" class="float-left"/>
                        <span class="tituloFont">Información personal</span>        
                        <img src="/Styles/images/orderedList3.png" alt="" class="float-right"/>
                    </div>                        

                    <div class="contenidoBox">
                            
                        <div class="clear-fix">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Nombres:</label>                        
                                <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>                                
                            </div>
                            <div class="float-left columna-x2 columna-x2-right">
                                <label>Apellidos:</label>         
                                <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
                            </div>
                        </div>                          
                        
                        <div class="clear-fix-margin-top">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Fecha de nacimiento:</label>         
                                <asp:TextBox ID="txtFechaNacimiento" runat="server"></asp:TextBox>
                            </div>
                            <div class="float-left columna-x2 columna-x2-right">
                                <label>Genero:</label>         
                                <div id="genero_usuario">
                                    <asp:RadioButton ID="rbtHombre" runat="server" Text ="Hombre" GroupName="genero_usuario"/>
                                    <asp:RadioButton ID="rbtMujer" runat="server" Text ="Mujer" GroupName="genero_usuario"/>
                                </div>
                                
                            </div>
                        </div>    
                        
                        <div class="clear-fix-margin-top">
                            <div class="float-left columna-x3 columna-x3-left">
                                <label>País:</label>
                                <asp:DropDownList ID="ddlPais" runat="server"/>                                
                                <ajaxToolkit:CascadingDropDown ID="cddlPais" runat="server" TargetControlID="ddlPais"
                                                            Category="Pais" PromptText="Seleccione un país" LoadingText="[Cargando paises...]" 
                                                            ServiceMethod="ObtenerPaisesDdl" />  
                            </div>
                            <div class="float-left columna-x3 columna-x3-middle">
                                <label>Departamento:</label>
                                <asp:DropDownList ID="ddlDepartamento" runat="server"/>
                                <ajaxToolkit:CascadingDropDown ID="cddlDepartamento" runat="server" TargetControlID="ddlDepartamento" ParentControlID="ddlPais"
                                                            Category="Departamento" PromptText="Seleccione un departamento" LoadingText="[Cargando departamento...]" 
                                                            ServiceMethod="ObtenerDepartamentosDdl" />
                            </div>
                            <div class="float-left columna-x3 columna-x3-right">
                                <label>Ciudad:</label>
                                <asp:DropDownList ID="ddlCiudad" runat="server"/>
                                <ajaxToolkit:CascadingDropDown ID="cddlCiudad" runat="server" TargetControlID="ddlCiudad" ParentControlID="ddlDepartamento"
                                                            Category="Ciudad" PromptText="Seleccione una ciudad" LoadingText="[Cargando ciudades...]" 
                                                            ServiceMethod="ObtenerCiudadesDdl" />
                            </div>
                        </div>
                        
                        <div class="clear-fix-margin-top">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Teléfono fijo:</label>
                                <asp:TextBox ID="txtTelefonoFijo" runat="server"></asp:TextBox>
                            </div>                            
                            <div class="float-left columna-x2 columna-x2-right">
                                <label>Teléfono Movil:</label>
                                <asp:TextBox ID="txtTelefonoMovil" runat="server"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                        <div class="botonesBox">
                            <asp:Button ID="btnAtras1" runat="server" CausesValidation="False" Text="Atras" OnClick="btnAtras1_Click"/>                
                            <asp:Button ID="btnSiguiente1" runat="server" Text="Siguiente" OnClick="btnSiguiente1_Click"/>                
                        </div>
                
                </asp:View>
                <asp:View ID="View3" runat="server" OnActivate="View3_Activate">

                    <div id="titutlo3" class="ui-widget-header ui-corner-all tituloBox">
                        <img src="/Styles/images/orderedList1.png" alt="" class="float-left"/>
                        <img src="/Styles/images/orderedList2.png" alt="" class="float-left"/>
                        <img src="/Styles/images/orderedList3.png" alt="" class="float-left"/>
                        <span class="tituloFont">Información Adicional</span>                                
                    </div>   
                    
                    <div class="contenidoBox">                            
                        <div class="clear-fix">
                            <div class="float-left columna-x2 columna-x2-left">
                                <label>Foto de perfil:</label>
                                <div id="contenedor_imagen" class="clear-fix-margin-top ui-widget ui-state-default ui-corner-all" style="text-align: center;">
                                    <img id="imgFoto" class="imagenFoto" src="/Styles/images/imgFotoPerfilHombre.jpg" alt=""/>
                                    <div class="clear-fix-margin">
                                        <%--<asp:LinkButton ID="lnkCambiarFoto" runat="server" OnClientClick="lnkCambiarFoto_OnClick()">Cambiar imagen</asp:LinkButton>--%>
                                        <asp:LinkButton ID="lnkCambiarFoto" runat="server" OnClientClick="lnkCambiarFoto_OnClick()">Cambiar imagen</asp:LinkButton>
                                        <%--<div id="fine-uploader" style="width: 140px; margin: 0 auto;"></div>--%>
                                        <%--<input type="button" id="LinkButton1" onclick="$('#dialogoCambiarFoto').wijdialog('open')" value="cambiar foto"/>--%>                                       
                                    </div>                                           
                                </div>
                            </div>
                            <div class="float-left columna-x2 columna-x2-right">
                                <div class="clear-fix">
                                    <label>Ocupación:</label>
                                    <asp:DropDownList ID="ddlOcupacion" runat="server" >
                                    </asp:DropDownList>   
                                </div>
                                <div class="clear-fix-margin-top">
                                    <label>Selcciona los que te describan:</label>
                                    <div id="caracteristicas_usuarios">
                                        <asp:CheckBox ID="chkFumador" runat="server" Text="Soy fumador"/>
                                        <asp:CheckBox ID="chkVehiculoPropio" runat="server" Text="Tengo vehículo"/>
                                    </div>
                                </div>                            
                                <div class="clear-fix-margin-top">
                                    <label>¿Algo más que quieras que tus compañeros de viaje conozcan?</label>    
                                    <asp:TextBox ID="txtMasInformacion" runat="server" TextMode="MultiLine" rows="2"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>                            
                            
                    <div class="botonesBox">
                        <asp:Button ID="btnAtras2" runat="server" Text="Atras" OnClick="btnAtras2_Click"/>                
                        <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar" OnClick="btnFinalizar_Click"/>                                            
                    </div>

                    


                    
                    <%--<asp:Panel ID="pnlModalCargarImagen" runat="server" CssClass="updateProgress" Style="display: none;">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <img id="imgFotoModal" class="imagenFoto" src="/Resources/imgFotoPerfilHombre.jpg" alt=""/>
                                
                                <asp:Image ID="Image1" runat="server" style="display: none;" ImageUrl="/Resources/uploading.gif"/>
                                <asp:AsyncFileUpload ID="AsyncFileUpload1"  runat="server" onpropertychange="add()" style="display: block;" 
                                    ThrobberID="Image1" OnUploadedComplete="AsyncFileUpload1_UploadedComplete" 
                                    OnClientUploadStarted="onClientUploadStared"/>
                                 
                                


                                <input id="btnAceptarImagen" type="button" value="Aceptar"/>                         
                                <input id="BtnQuitarImagen" type="button" value="Quitar" onclick="BtnQuitarImagen_OnClick()"/>
                                <input id="btnCancelarImagen" type="button" value="Cancelar"/>
                                <input id="BtnBuscarImagen" type="button" value="Buscar..." onclick="ctl00_MainContent_AsyncFileUpload1_ctl02.click()" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>--%>                   
                    
                    <div id="dialogoCambiarFoto" title="Cambiar foto">
                        <div class="clear-fix-margin" style="text-align: center; vertical-align: middle;">
                            <img id="imagenFotoModal" class="imagenFoto" src="/Styles/images/imgFotoPerfilHombre.jpg" alt=""/>
                        </div>                        
                        <div id="dialogoBotonesBox" class="clear-fix dialogoBotonesBox" style="margin: 0 auto;">
                            <div id="fine-uploader" class="float-left" style="width: 90px; margin-left: 20px;"></div>
                            <input id="btnQuitarImagen" type="button" value="Quitar" onclick="BtnQuitarImagen_OnClick()" style="margin-left: 4px"></input>
                            <input id="btnAceptarImagen" class="float-right" type="button" value="Aceptar" onclick="onOk_ImageUserModalPopup()" style="margin-right: 20px;"></input>
                        </div>
                    </div> 	

                    

                    <%--<asp:ModalPopupExtender 
                        ID="lnkCambiarFoto_ModalPopupExtender" 
                        DropShadow="True"
                        OkControlID="btnAceptarImagen" 
                        CancelControlID="btnCancelarImagen"
                        OnOkScript="onOk_ImageUserModalPopup()"
                        OnCancelScript="onCancel_ImageUserModalPopup()"
                        PopupControlID="pnlModalCargarImagen"
                        TargetControlID="lnkCambiarFoto"
                        BackgroundCssClass="modalBackground" 
                        PopupDragHandleControlID="btnCancelarImagen"
                        runat="server" >                
                    </asp:ModalPopupExtender>--%>                    
                    
                </asp:View>
            </asp:MultiView>

        </ContentTemplate>
        
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSiguiente" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnSiguiente1" EventName="Click"  />
            <asp:AsyncPostBackTrigger ControlID="btnAtras1" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnAtras2" EventName="Click" />
        </Triggers>      
               
    </asp:UpdatePanel>
    



    
 
    
    


<%--    <asp:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server" TargetControlID="UpdatePanel1">
        <Animations>
            <OnUpdating>
                <FadeOut Duration=".5" Fps="20" MinimumOpacity=".5" MaximumOpacity="1"/>
            </OnUpdating>
            <OnUpdated>
                <FadeIn Duration=".5" Fps="20" MinimumOpacity="0" MaximumOpacity="1"/>                
            </OnUpdated>    
        </Animations>        
    </asp:UpdatePanelAnimationExtender>--%>

    
    
<%--<script type="text/javascript" language="javascript">
    var ModalProgress = '<%= ModalProgress.ClientID %>';
    
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
    function beginReq(sender, args) {
        // shows the Popup 
        $find(ModalProgress).show();
    }

    function endReq(sender, args) {
        //  shows the Popup 
        $find(ModalProgress).hide();
    }
</script>     

<asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress"> 
    <asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server" AssociatedUpdatePanelID="UpdatePanel2"> 
      <ProgressTemplate> 
        <div> 
          <img src="Resources/ajax_loader.gif" class="imagenFoto" alt="Processing" /> 
        </div> 
      </ProgressTemplate> 
    </asp:UpdateProgress> 
</asp:Panel>
<asp:ModalPopupExtender ID="ModalProgress" runat="server" 
TargetControlID="panelUpdateProgress" BackgroundCssClass="modalBackground" 
PopupControlID="panelUpdateProgress" /> --%>
    
   
    

</asp:Content>



