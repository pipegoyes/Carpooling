<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="Carpooling.CrearUsuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Gaia.WebWidgets.Extensions" Namespace="Gaia.WebWidgets.Extensions" TagPrefix="gaia" %>

<%@ Register Assembly="Gaia.WebWidgets.CommunityExtensions" Namespace="Gaia.WebWidgets.CommunityExtensions" TagPrefix="gaia" %>

<%@ Register Assembly="Gaia.WebWidgets" Namespace="Gaia.WebWidgets" TagPrefix="gaia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />

    <%-- Muestra la animacion de cuando se carga la foto del perfil --%>    
    <script type="text/javascript">
        function onClientUploadStared(sender, e) {
            $("#divFoto").css("display", "none");
            $("#divAnimacionCargando").css("display", "block");
        }

        function onClientUploadComplete(sender, e) {
            $("#divAnimacionCargando").css("display", "none");
            $("#divFoto").css("display", "block");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                            <%--<asp:TextBox ID="txtFechaNacimiento" runat="server"></asp:TextBox>--%>

                         <%--   <asp:CalendarExtender ID="txtFechaNacimiento_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaNacimiento">
                            </asp:CalendarExtender>--%>

    <gaia:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div id="datosPersonales" class="datosContenedor">
                <div class="titulo">1. Datos basicos</div>
                <div class="contenido">
                    <div class="campoDato">
                        <div class="textoCampo">Nombres:</div>
                        <div>
                            <asp:TextBox ID="txtNombres" runat="server" CssClass="valorCampo2"></asp:TextBox>
                            <asp:TextBox ID="txtApellidos" runat="server" CssClass="valorCampo2"></asp:TextBox>
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
                    <gaia:Button ID="btnSiguiente2" runat="server" Text="Siguiente" OnClick="btnSiguiente2_Click"/>                
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
                            <gaia:DateTimePicker ID="DateTimePicker1" runat="server" />
                        </div>
                    </div>
                    <div class="campoDato">
                        <div class="textoCampo">Sexo:</div>
                        <div class="valorCampo">
                            <gaia:RadioButtonList ID="rdbSexo" runat="server">
                                <asp:ListItem Value="1" Text="Masculino"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Femenino" ></asp:ListItem>
                            </gaia:RadioButtonList>
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
                            <gaia:CheckBox ID="chkFumador" runat="server" />
                        </div>
                    </div>
                    <div class="campoDato">
                        <div class="textoCampo">Vehiculo propio:</div>
                        <div class="valorCampo">
                            <gaia:CheckBox ID="chkVehiculoPropio" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="botones">
                    <gaia:Button ID="btnAtras1" runat="server" Text="Atras" OnClick="btnAtras1_Click"/>                
                    <gaia:Button ID="btnSiguiente3" runat="server" Text="Siguiente" OnClick="btnSiguiente3_Click"/>                
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
                            <div id="divAnimacionCargando" style="display: none;">
                                <img id="imgAnimacionCargando" class="imagenFoto" alt="Cargando...." src="Resources/ajax_loader.gif"/>    
                            </div>
                            <div id="divFoto">
                                <gaia:Image ID="imgFoto" runat="server" CssClass="imagenFoto" ImageUrl="Resources/imgFotoPerfilHombre.png"/>
                                <%--<gaia:Image ID="Image1" runat="server" />--%>
                                <%--<asp:Image ID="imgFoto" runat="server" CssClass="imagenFoto" ImageUrl="Resources/imgFotoPerfilHombre.png"/>--%>
                            </div>                                    
                        </div>
                        <div class="divClear">

                            <asp:AsyncFileUpload ID="fldFotoUpload" runat="server" 
                                OnClientUploadStarted="onClientUploadStared" OnClientUploadComplete="onClientUploadComplete"/>

                            <%--<gaia:FileUpload ID="FileUpload1" runat="server" MaxFiles="1" ImgLoadingSrc="Resources/uploading.gif" 
                                TextUploading="" TextUploaded="" TextDelete="" TextHeader="" GroupingText="" />--%>                            
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
                    <gaia:Button ID="btnAtras2" runat="server" Text="Atras" OnClick="btnAtras2_Click"/>                
                    <gaia:Button ID="btnFinalizar" runat="server" Text="Finalizar"/>  
                                  
<%--                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                                    
                            </ContentTemplate>
                    </asp:UpdatePanel>--%>
                            
                </div>
            </div>                
        </asp:View>        
        
        
            
    </gaia:MultiView>

</asp:Content>
