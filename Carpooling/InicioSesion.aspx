<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="Carpooling.InicioSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/InicioSesion.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bannerInfoDiv">Banner</div>
    <div class="ultimosViajes">
        <div class="titulo">Ultimos viajes</div>
        <div class="text">Estos son unos de nuestros ultimos viajes</div>
        <div class="divRelleno"></div>
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
                    <asp:Image ID="Image1" CssClass="pictureUV" ImageUrl="Resources/imgFotoPerfilHombre.png" runat="server"/>
                </div>
                <div class="valorCampoUV rightPosition">Andres Felipe</div>
                <div class="divClear"></div>
                <div class="divRelleno"></div>
            </div>
            <div class="divClear"></div>

        </div>
    
    </div>
    <div class="inicioSesion">
        <div class="titulo">Inicio de sesion</div>
        <div id="textoInicioSesion" class="text">Por favor ingrese los datos de su cuenta de usuario</div>
        <div class="labelCampo">
            <asp:Label ID="lblUsuaio" runat="server" Text="Nombre de usuario:"></asp:Label>
        </div>
        <div class="textBoxCampo">
            <asp:TextBox ID="txbUsuario" runat="server"></asp:TextBox>
        </div>
        <div class="divClear"></div>
        <div class="labelCampo">
            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:"></asp:Label>
        </div>
        <div class="textBoxCampo">
            <asp:TextBox ID="txbContrasenia" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div class="divClear"></div>
        <div class="btnIniciarSesion">
            <asp:ImageButton ID="btnIniciarSesion" ImageUrl="Resources/btnIniciarSesion.png" runat="server"/>
        </div>
        
        <div id="olvidoContraseña">¿Olvido su contraseña?</div>
    </div>

    <div class="divClear"></div>

</asp:Content>
