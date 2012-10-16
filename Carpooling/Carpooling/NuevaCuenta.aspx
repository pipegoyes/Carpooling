<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaCuenta.aspx.cs" Inherits="Carpooling.NuevaCuenta" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />

<%-- Desactiva el control que hace el ajax postback --%>    
<script type="text/javascript">
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
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div id="datosPersonales" class="datosContenedor">
                        <div class="titulo">1. Datos basicos</div>
                        <div class="contenido">
                            <div class="campoDato">
                                <div class="textoCampo">Nombres:</div>
                                <div>
                                    <asp:TextBox ID="txtNombres" runat="server" CssClass="valorCampo2"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtNombres_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="txtNombres" WatermarkText="Nombres">
                                    </asp:TextBoxWatermarkExtender>
                                    <asp:TextBox ID="txtApellidos" runat="server" CssClass="valorCampo2"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtApellidos_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="txtApellidos" WatermarkText="Apellidos">
                                    </asp:TextBoxWatermarkExtender>
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
                                    <asp:CalendarExtender ID="txtFechaNacimiento_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaNacimiento">
                                    </asp:CalendarExtender>
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
                <asp:View ID="View3" runat="server">
                    <div id="datosAdicionales" class=" datosContenedor">
                        <div class="titulo">3. Datos Adicionales</div>
                        <div class="contenido">
                            <div class="campoDato">
                                <div class="textoCampo">Foto de perfil:</div>
                                <div class="marcoImagen">
                                    <asp:Image ID="imgFoto" runat="server" CssClass="imagenFoto" ImageUrl="Resources/imgFotoPerfilHombre.png" />
                                </div>
                                <asp:AsyncFileUpload ID="imgFotoUpload" runat="server"  />
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
<%--                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    
                                    </ContentTemplate>
                            </asp:UpdatePanel>--%>
                            
                        </div>
                    </div>                
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
    
    <asp:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server" TargetControlID="UpdatePanel1">
        <Animations>
            <OnUpdating>                
                <FadeOut Duration=".5" Fps="20" MinimumOpacity=".5" MaximumOpacity="1"/>
            </OnUpdating>           
            <OnUpdated>
                <FadeIn Duration=".5" Fps="20" MinimumOpacity="0" MaximumOpacity="1"/>                
            </OnUpdated>    
        </Animations>        
    </asp:UpdatePanelAnimationExtender>

    
    
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



