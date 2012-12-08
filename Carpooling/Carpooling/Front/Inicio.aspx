<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Carpooling.Front.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <script type="text/javascript" src="./Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="./Scripts/Inicio.js"></script>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >

    <div id="bannerDiv" class="bannerInfoDiv">
    Aqui va el banner
    </div>
    <div id="buscador" class="buscadorDiv">
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
            <div><asp:TextBox ID="txbCiudadOrigen" runat="server"></asp:TextBox></div>
        </div>
        <div class="buscadorElemento">
            <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
            <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
        </div>
        <div id ="btnBuscar" class="buscadorElemento" onclick="GenerarRuta()">Boton</div>

        <div class="divClear"></div>
    </div>

    <div id="map_canvas" onclick="initialize()"  class="mapaDiv" >Has click aqui!!</div>

</asp:Content>
