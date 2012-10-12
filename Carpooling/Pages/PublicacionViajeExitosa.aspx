<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublicacionViajeExitosa.aspx.cs" Inherits="Carpooling.Pages.PublicacionViajeExitosa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/PublicacionViajeExitosa.css" rel="stylesheet" type="text/css"/>
    <script src="../Scripts/PublicacionViajeExitosa.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">Publicacion exitosa</div>
    <div id="contenedorRutaViaje" class="leftPosition">
        
        
        <div class="subtitulo">Ruta de viaje</div>
        <div class="leftPosition contenedorSecundarioRV">
            <div class="leftPosition labelRutaViaje">Desde</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="lblDesde" Text="Bogota" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
            <div class="leftPosition labelRutaViaje">pasa por</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="lblPasaPor1" Text="Chia" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
            <div class="leftPosition labelRutaViaje">Desde</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="lblHasta" Text="Cali" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>


        <div  class="leftPosition contenedorSecundarioRV">
            <div class="rightPosition textoRutaViaje">
                <asp:Label ID="lblDistancia" Text="372 km" runat="server"></asp:Label>
            </div>
            <div class="rightPosition labelRutaViaje">Distancia</div>
            <div class="divClear"></div>
            <div class="rightPosition textoRutaViaje">
                <asp:Label ID="lblTiempoEstimado" Text="6 horas" runat="server"></asp:Label>
            </div>
            <div class="rightPosition labelRutaViaje" >Tiempo Estimado</div>
            <div class="divClear"></div>

        </div>
        <div class="divClear"></div>

    </div>
    
    <div id="contenedorDatosViaje" class="leftPosition">
        <div class="subtitulo">Datos del viaje</div>
        <div>
            <div class="leftPosition labelDatosViaje">Fecha de viaje</div>
            <div class="leftPosition">
                <asp:Label ID="lblFechaViaje" Text="04/13/2012 15:00" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div>
            <div class="leftPosition labelDatosViaje">Tarifa contributiva</div>
            <div class="leftPosition">
                <asp:Label ID="Label1" Text="$65.000 Col" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div>
            <div class="leftPosition labelDatosViaje">Cupos</div>
            <div class="leftPosition">
                <asp:Label ID="Label2" Text="3 Sillas" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div class="subtitulo">Datos adicionales</div>
        <div>
            <div>Comentario</div>
            <div>
                <asp:Label  Text="Se permite fumar, se requiere una previa llamada para confimar" runat="server"></asp:Label>
            </div>
    
        </div>
        
    </div>
    <div class="divClear"></div>
    <div id="contenedorMapa">Google Map</div>
</asp:Content>
