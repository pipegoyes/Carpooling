<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="BuscarViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.BuscarViaje" %>
<%@ Register Src="~/Front/Cuentas/wuc/PerfilPublico.ascx" TagName="PerfilPublico" TagPrefix="uc" %>

<asp:Content runat="server" ID="ScriptContent" ContentPlaceHolderID="ScriptsContent">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
    <script src="/Scripts/front-js/BuscarViaje.js" type="text/javascript" > </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/front-css/BuscarViaje.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="titulo">Busqueda de viajes</div>
    <div class="text">Para realizar una busqueda solo se requiere saber cuando deseas viajar, hacia donde quieres y desde que ciudad </div>
    
    <div id="buscador" class="buscadorDiv">
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
            <div><asp:TextBox ID="txbCiudadOrigen" runat="server"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RFVCiudadOrigen" ControlToValidate="txbCiudadOrigen" 
                                        Display="None" ErrorMessage="<b>Valor requerido</b><br>La Ciudad de origen es un dato requerido</br>" runat="server"/> 
            <%--<asp:CustomValidator ControlToValidate="txbCiudadDestino" ClientValidationFunction=""
            ErrorMessage="<b>Valor requerido</b><br>La Ciudad de origen es un dato requerido</br>" runat="server"></asp:CustomValidator>--%>
            <ajaxToolkit:ValidatorCalloutExtender 
                runat="Server"
                ID="AVCCiudadOrigen"
                TargetControlID="RFVCiudadOrigen"
                HighlightCssClass="errorValidacion" />
        </div>
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
            <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RFVCiudadDestino" ControlToValidate="txbCiudadDestino" 
                                        Display="None" ErrorMessage="<b>Valor requerido</b><br>La Ciudad de destino es un dato requerido</br>" runat="server"/> 
            <ajaxToolkit:ValidatorCalloutExtender 
                runat="Server"
                ID="AVCCiudadDestino"
                TargetControlID="RFVCiudadDestino"
                HighlightCssClass="errorValidacion" />
        </div>
        <div class="buscadorElemento">
            <div><asp:Label ID="Label1" runat="server" Text="Fecha:"></asp:Label></div>
            <div><asp:TextBox ID="calendarFechaViaje" runat="server"></asp:TextBox> </div>
        </div>
        <div id="divBtnBuscar" class="buscadorElemento">
            <asp:Button runat="server" ClientID="btnBuscar" ID="btnBuscarViaje" CssClass="button-gradient green float-left" Text="Buscar" CausesValidation="True" onclick="btnBuscarViaje_Click"/>
        </div>
        
        <div class="divClear"></div>
    </div>
    <asp:Panel ID="panelSinResultados" class="ui-widget" runat="server" Visible="False" Width="450px">
        <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
            <p>
                <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                <strong>Alert:</strong>
                <asp:Label ID="lblMensajeError" runat="server" Text="No hay viajes entre esas ciudades para esa fecha, podría intentarlo sin ingresar la fecha para ver todos los viajes."></asp:Label>
            </p>
        </div>
    </asp:Panel>
    <div runat="server" id="tituloResultados" class="titulo" Visible="False">Resultados de la busqueda</div>
    <div class="divRelleno"></div>
    <div>
        <asp:DataList runat="server" ID="dataListItemsViajesEncontrados" 
                      ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="BtnVerDetalle_Click" >
            <AlternatingItemStyle BackColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                         ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
            <HeaderTemplate>
                
                <div class="divCelda">
                    <asp:Label ID="Label2" runat="server" Text="Fecha y hora"></asp:Label>    
                </div>
                <div class="divCelda">
                    <asp:Label ID="Label3" runat="server" Text="Conductor"></asp:Label>    
                </div>
                <div class="divCelda">
                    <asp:Label ID="Label4" runat="server" Text="Ciudad Origen"></asp:Label>    
                </div>
                <div class="divCelda">
                    <asp:Label ID="Label5" runat="server" Text="Ciudad Destino"></asp:Label>    
                </div>
                <div class="clearfix"></div>
            </HeaderTemplate>
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                <div class="divCelda">
                    <asp:Label ID="LinkButton1" runat="server" Text='<%#                                        Eval("FechaHora") %>'/>    
                </div>
                <div class="divCelda">
                    <asp:LinkButton ID="lblNombreConductor" runat="server" Text='<%#Eval("NombreConductor") %>' CommandName="VerPerfil" CommandArgument=<%#Eval("IdUsuario") %>></asp:LinkButton>                        
                </div>
                <div class="divCelda">
                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("ParadaOrigen") %>'></asp:Label>    
                </div>
                <div class="divCelda">
                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("ParadaDestino") %>'></asp:Label>    
                </div>
                <div class="divClear">
                    <asp:LinkButton ID="btnVerDetalle" runat="server" Text="Ver detalle" CommandName="VerDetalle" CommandArgument='<%#Eval("IdViaje") %>' ></asp:LinkButton>
                </div>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    </div>

    <uc:PerfilPublico ID="ucPerfilPublico" runat="server"/>
    <%--
    <div>
        <div class="viajeUV">
            <div class="leftPosition">
                <div class="divRelleno"></div>
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition">Hacia:</div>
                    <div class="valorCampoUV leftPosition">Bogota</div>  
                </div>
                <div class="divClear"></div>  
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Desde:</div>
                    <div class="valorCampoUV leftPosition">Cali</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Cupos:</div>
                    <div class="valorCampoUV leftPosition">2</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Fecha:</div>
                    <div class="valorCampoUV leftPosition">19/01/2012</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
            </div>
            <div class="rightPosition">
                <div class="divRelleno"></div>
                <div class="rightPosition">
                    <asp:Image ID="Image1" CssClass="pictureUV" ImageUrl="../Resources/imgFotoPerfilHombre.png" runat="server"/>
                </div>
                <div class="valorCampoUV rightPosition">Andres Felipe</div>
                <div class="divClear"></div>
                <div class="divRelleno"></div>
            </div>
            <div class="divClear"></div>
        </div>
        <div class="viajeUV">
            <div class="leftPosition">
                <div class="divRelleno"></div>
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition">Hacia:</div>
                    <div class="valorCampoUV leftPosition">Bogota</div>  
                </div>
                <div class="divClear"></div>  
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Desde:</div>
                    <div class="valorCampoUV leftPosition">Cali</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Cupos:</div>
                    <div class="valorCampoUV leftPosition">2</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
                <div class="leftPosition">
                    <div class="labelCampoUV leftPosition" >Fecha:</div>
                    <div class="valorCampoUV leftPosition">19/01/2012</div>
                    <div class="divClear"></div>       
                </div>
                <div class="divClear"></div> 
            </div>
            
            <div class="rightPosition">
                <div class="divRelleno"></div>
                <div class="rightPosition">
                    <asp:Image ID="Image2" CssClass="pictureUV" ImageUrl="../Resources/imgFotoPerfilHombre.png" runat="server"/>
                </div>
                <div class="valorCampoUV rightPosition">Andres Felipe</div>
                <div class="divClear"></div>
                <div class="divRelleno"></div>
            </div>
            <div class="divClear"></div>

        </div>
    </div>
    --%>
</asp:Content>