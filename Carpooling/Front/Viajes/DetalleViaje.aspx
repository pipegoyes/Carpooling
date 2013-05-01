<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje" %>
<%@ PreviousPageType VirtualPath="BuscarViaje.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/front-js/DetalleViaje.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
     <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Detalle del viaje.</h1>
            </hgroup>
            <p>
                <h2>Toda la información que necesitas para participar del Carpooling.</h2>
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
     <div id="contenedorRutaViaje" class="leftPosition">
        <div class="subtitulo">Ruta de viaje</div>
        <div class="leftPosition contenedorSecundarioRV">
            <div class="leftPosition labelRutaViaje">Ciudad Origen:</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="txtCiudadOrigen" Text="Sin ciudad" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
            
            <div class="leftPosition labelRutaViaje">Ciudad destino</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="txtCiudadDestino" Text="Sin Ciudad" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
            <asp:DataList runat="server" ID="dataListParada" 
                ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%">
                <AlternatingItemStyle BackColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                <HeaderTemplate>
                    <div class="divCeldaParada"># Parada</div>
                    <div class="divCeldaParada">Ciudad</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="divCeldaParada">
                        <asp:Label ID="lblNumeroParada" runat="server" Text='<%# Eval("NumeroParada") %>'></asp:Label>
                    </div>
                    <div class="divCeldaParada">
                        <asp:Label runat="server" Text='<%# Eval("Direccion") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <%--un data list con las paradas--%><%--
            <div class="leftPosition labelRutaViaje">pasa por</div>
            <div class="leftPosition textoRutaViaje">
                <asp:Label ID="lblPasaPor1" Text="Chia" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>--%>
        </div>


        <%--<div  class="leftPosition contenedorSecundarioRV">
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
        <div class="divClear"></div>--%>

    </div>
    
    <div id="contenedorDatosViaje" class="leftPosition">
        <div class="subtitulo">Datos del viaje</div>
        <div>
            <div class="leftPosition labelDatosViaje">Fecha de viaje:</div>
            <div class="leftPosition">
                <asp:Label ID="txtFechaViaje" Text="Sin Fecha" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
            <div class="leftPosition labelDatosViaje">Hora del viaje:</div>
            <div class="leftPosition">
                <asp:Label ID="txtHora" Text="Sin hora" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div>
            <div class="leftPosition labelDatosViaje">Tarifa:</div>
            <div class="leftPosition">
                <asp:Label ID="txtTarifa" Text="Tarifa No disponible" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div>
            <div class="leftPosition labelDatosViaje">Cupos</div>
            <div class="leftPosition">
                <asp:Label ID="txtCupos" Text="Pendiente" runat="server"></asp:Label>
            </div>
            <div class="divClear"></div>
        </div>
        <div class="subtitulo">Datos del conductor</div>
        <div>
            <div>Nombre del conductor: </div>
            <asp:Label runat="server" ID="txtNombreConductor"></asp:Label>
        </div>
        
    </div>
    <div class="divClear"></div>
    <div id="contenedorMapa">Google Map</div>

</asp:Content>
