<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearViajePaso1.aspx.cs" Inherits="Carpooling.CrearViajePaso1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/CrearViajePaso1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/CrearViajePaso1.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="titulo">Paso 1. Crear ruta de viaje</div>
    <div class="text">Seleccione las ciudades de origen, destino y paradas (si aplica)</div>
    <div>
        <div class="creacionElemento">
            <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
            <div><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
        </div>
        <div class="creacionElemento">
            <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
            <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
        </div>
        <div class="creacionElemento">
            <%--<div>Agregar paradas</div>  --%>  
            <asp:ImageButton ImageUrl="Resources/btnAgregarParadas.png" runat="server"/>
        </div>
        <div class="divClear"></div>
        <div class="divMediaLinea"></div>

        <div id="contenedorParadas">
            <div class="paradaElemento">
                <div class="labelParadas leftPosition">
                    <asp:Label ID="lblParada1" Text="Parada 1" runat="server"></asp:Label>
                </div>
                <div class="leftPosition">
                    <asp:TextBox ID="txbParada1" runat="server"></asp:TextBox>
                </div>
                <div class="btnEliminar leftPosition"></div>
                <div class="divClear"></div>
            </div>
            <div class="paradaElemento">
                <div class="labelParadas leftPosition">
                    <asp:Label ID="Label1" Text="Parada 2" runat="server"></asp:Label>
                </div>
                <div class="leftPosition">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </div>
                <div class="btnEliminar leftPosition"></div>
                <div class="divClear"></div>
            </div>
            <div class="paradaElemento">
                <div class="labelParadas leftPosition">
                    <asp:Label ID="Label2" Text="Parada 3" runat="server"></asp:Label>
                </div>
                <div class="leftPosition">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </div>
                <div class="btnEliminar leftPosition"></div>
                <div class="divClear"></div>
            </div>
            
            <div class="titulo">Verifique su ruta</div>
            <div id="contenedorMapa">Mapa</div>
            <div class="divRelleno"></div>
            <div id="btnSiguientePaso" class="rightPosition">Siguiente paso</div>
        </div>
    </div>

</asp:Content>
