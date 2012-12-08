<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="BuscarViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.BuscarViaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/BuscarViaje.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/InicioSesion.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">Busqueda de viajes</div>
    <div class="text">Para realizar una busqueda solo se requieren saber cuando deseas viajar, hacia donde quieres y desde que ciudad </div>
    
    <div id="buscador" class="buscadorDiv">
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
            <div><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
        </div>
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
            <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
        </div>
        <div class="buscadorElemento">
            <div><asp:Label ID="Label1" runat="server" Text="Fecha:"></asp:Label></div>
            <div><asp:TextBox ID="calendarFechaViaje" runat="server"></asp:TextBox> </div>
        </div>
        <div class="divClear"></div>
    </div>
    
    <div class="titulo">Resultados de la busqueda</div>
    <div class="divRelleno"></div>
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
    
</asp:Content>
