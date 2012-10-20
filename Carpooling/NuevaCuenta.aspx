<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaCuenta.aspx.cs" Inherits="Carpooling.NuevaCuenta" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />

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
    //
    var pathImagen;
    function lnkCambiarFoto_OnClick() {
        pathImagen = $("#hfdImagePath").attr("value");
        $("#imgFotoModal").attr("src", $("#imgFoto").attr("src"));
        $("#ctl00_MainContent_AsyncFileUpload1_ctl02").attr("value", null);
    }

    //funcion que se ejecuta al aceptar el cuadro modal de cargar imagen
    function onOk_ImageUserModalPopup() {           
        var imageUserPath = $("#hfdImagePath").attr("value");
        if (imageUserPath != "") {
            $("#imgFoto").attr("src", imageUserPath);
        }
    }
    
    //funcion que se ejecuta al cancelar el cuadro modal de cargar imagen
    function onCancel_ImageUserModalPopup() {
        $("#hfdImagePath").attr("value", pathImagen);
        $("#imgFotoModal").attr("src", $("#imgFoto").attr("src"));
    }
    
    //funcion que se ejecuta con el click en el boton quitar imagen del popup modal de cambiar imagen
    function BtnQuitarImagen_OnClick() {
        $("#imgFotoModal").attr("src", "/Resources/imgFotoPerfilHombre.jpg");
        $("#hfdImagePath").attr("value", "/Resources/imgFotoPerfilHombre.jpg");
    }
    
    //muestra la animacion de cuando se carga la foto del perfil
    function onClientUploadStared(sender, e) {
        $("#imgFotoModal").attr("src", "/Resources/ajax_loader.gif");
    }
</script>    
      
</asp:Content>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" class="content-wrapper main-content clear-fix">
    
    <input id="hfdImagePath" type="hidden" name="hfdImagePath" value="/Resources/imgFotoPerfilHombre.jpg"/>      

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
               
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="2">
                <asp:View ID="View1" runat="server">
                    <div id="datosPersonales" class="datosContenedor">
                        <div class="titulo">1. Datos basicos</div>
                        <div class="contenido">
                            <div class="campoDato">
                                <div class="textoCampo">Nombres:</div>
                                <div>
                                    <asp:TextBox ID="txtNombres" runat="server" CssClass="valorCampo2"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtNombres_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="txtNombres" WatermarkText="Nombres"></asp:TextBoxWatermarkExtender>
                                    <asp:TextBox ID="txtApellidos" runat="server" CssClass="valorCampo2"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtApellidos_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="txtApellidos" WatermarkText="Apellidos"></asp:TextBoxWatermarkExtender>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Correo electronico:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtCorreoElectronico" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Confirmar correo electronico:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtReCorreoElectronico" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Nombre de usuario:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtNombreUsuario" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Contraseña:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtContrasena" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Confirmar contraseña:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtReContrasena" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="botones">
                            <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" OnClick="btnSiguiente_Click" />                
                        </div>
                    </div>                

                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div id="datosContacto" class="datosContenedor">      
                        <div class="titulo">2. Datos personales y contacto</div>
                        <div class="contenido">
                            <div class="campoDato">
                                <div class="textoCampo">Ciudad:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Fecha de nacimiento:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtFechaNacimiento" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtFechaNacimiento_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaNacimiento"></asp:CalendarExtender>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Sexo:</div>
                                <div class="valorCampo">
                                    <asp:RadioButtonList ID="rdbSexo" runat="server">
                                        <asp:ListItem Value="1" Text="Masculino"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Femenino" ></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Ocupación:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtOcupacion" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Teléfono fijo::</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtTelefonoFijo" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Teléfono Movil:</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtTelefonoMovil" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Fumador:</div>
                                <div class="valorCampo">
                                    <asp:CheckBox ID="chkFumador" runat="server" />
                                </div>
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">Vehiculo propio:</div>
                                <div class="valorCampo">
                                    <asp:CheckBox ID="chkVehiculoPropio" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="botones">
                            <asp:Button ID="btnAtras1" runat="server" Text="Atras" OnClick="btnAtras1_Click"/>                
                            <asp:Button ID="btnSiguiente1" runat="server" Text="Siguiente" OnClick="btnSiguiente1_Click"/>                
                        </div>
                    </div>                
                </asp:View>
                <asp:View ID="View3" runat="server" OnActivate="View3_Activate">
                    <div id="datosAdicionales" class=" datosContenedor">
                        <div class="titulo">3. Datos Adicionales</div>
                        <div class="contenido">
                            <div class="campoDato">
                                <div class="textoCampo">Foto de perfil:</div>
                                <div class="marcoImagen">
                                    <img id="imgFoto" class="imagenFoto" src="/Resources/imgFotoPerfilHombre.jpg" alt=""/>
                                </div>
                                <div class="divClear">
                                    <asp:LinkButton ID="lnkCambiarFoto" runat="server" OnClientClick="lnkCambiarFoto_OnClick()">Cambiar imagen</asp:LinkButton>
                                </div>                               
                            </div>
                            <div class="campoDato">
                                <div class="textoCampo">¿Algo mas que quieras que tus compañeros de viaje conozcan?</div>
                                <div class="valorCampo">
                                    <asp:TextBox ID="txtMasInformacion" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="botones">
                            <asp:Button ID="btnAtras2" runat="server" Text="Atras" OnClick="btnAtras2_Click"/>                
                            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar" OnClick="btnFinalizar_Click"/>                                            
                        </div>
                    </div>       

                    
                    <asp:Panel ID="pnlModalCargarImagen" runat="server" CssClass="updateProgress" Style="display: none;">
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
                    </asp:Panel>                   
                    
                    <asp:ModalPopupExtender 
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
                    </asp:ModalPopupExtender>                    
                    
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



