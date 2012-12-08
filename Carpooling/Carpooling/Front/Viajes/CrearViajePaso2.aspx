<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="CrearViajePaso2.aspx.cs" Inherits="Carpooling.Front.Viajes.CrearViajePaso2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="stylesheet" href="/Styles/CrearViajePaso2.css"/>
    <script type="text/javascript" src="/Scripts/CrearViajePaso2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="titulo">Paso 2. Datos del viaje</div>
    <div class="text">Configura todos los datos de tu viaje</div>
    
    
    <div id="contenedorRutaViaje" class="contenedorElementos">
        <div class="creacionElemento2 centerDivs">
            <div class="subtitulo">Ruta de viaje</div>
        </div>
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Desde</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:Label ID="lblDesde" Text="Bogota" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Hacia</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:Label ID="txbHacia" Text="Cali" runat="server"></asp:Label>    
            </div>
            <div class="divClear"></div>
        </div>
    </div>
    
    
    <div class="contenedorElementos">
        <div class="creacionElemento2 centerDivs">
            <div class="subtitulo">Informacion basica</div>
        </div>
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Rol*</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:TextBox ID="txbRol" runat="server"></asp:TextBox>    
            </div>
            <div class="divClear"></div>
        </div>
        
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Tarifa contributiva*</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:TextBox ID="txbTarifax" runat="server"></asp:TextBox>    
            </div>
            <div class="divClear"></div>
        </div>
        
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Fecha de partida*</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:TextBox ID="txbFechaPartida" runat="server"></asp:TextBox>    
            </div>
            <div class="divClear"></div>
        </div>
        
        <div class="creacionElemento2 centerDivs">
            <div class=" lblCreacion2 leftPosition centerDivs">Cupos*</div>
            <div class=" txbCreacion2 leftPosition centerDivs">
                <asp:TextBox ID="txbCupos" runat="server"></asp:TextBox>    
            </div>
            <div class="divClear"></div>
        </div>
         
    </div>
    <div id="botonSiguiente2" onclick="publicar()"  class="rightPosition">Publicar</div>
    
</asp:Content>
