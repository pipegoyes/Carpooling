<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="Carpooling.Front.InicioSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/InicioSesion.css" rel="stylesheet" type="text/css" />
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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
                    <asp:Image ID="Image1" CssClass="pictureUV" ImageUrl="../Resources/imgFotoPerfilHombre.png" runat="server"/>
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
        <div>
            <asp:Label ID="lblUsuaio" class="labelCampo" runat="server" Text="Nombre de usuario:"></asp:Label>
            <asp:TextBox ID="txbUsuario" CssClass="textBoxCampo" runat="server"></asp:TextBox>    
            <asp:Label ID="lblContraseña" CssClass="labelCampo" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txbContrasenia" CssClass="textBoxCampo" TextMode="Password" runat="server"></asp:TextBox>    
        </div>
        <div>
            <%--<asp:ImageButton ID="btnIniciarSesion" ImageUrl="../Resources/btnIniciarSesion.png" runat="server"/>--%>
            <asp:Button ID="btnIniciarSesion" CssClass="btnIniciarSesion" Text="Iniciar Sesion" runat="server"/>
        </div>
        
        <div id="olvidoContraseña">¿Olvido su contraseña?</div>
    </div>

    <div class="divClear"></div>

</asp:Content>
