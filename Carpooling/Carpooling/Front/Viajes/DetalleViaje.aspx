﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje" %>
<%@ PreviousPageType VirtualPath="BuscarViaje.aspx" %>
<%@ Register tagPrefix="uc" tagName="PopUpCupos" src="../UserControls/PopUpConfrimarCupos.ascx" %>
<%@ Register tagPrefix="uc" tagName="PopUpConfirmation" src="../UserControls/PopUpOk.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
    <script src="../../Scripts/front-js/DetalleViaje.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <uc:PopUpCupos ID="popUpConfirmarCupos" runat="server" 
        MensajePopUp="Ingrese el numero de cupos a solicitar" 
        TituloMensaje="Confirmar numero de cupos" 
        OnOnClickAceptar="BtnConfirmarCuposClick"></uc:PopUpCupos> 
    <uc:PopUpConfirmation ID="popUpConfirmation" runat="server" OnOnClickAceptar="FinalTransaccionClick" />
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
        </div>
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
                <asp:Label ID="txtTarifa" Text="No disponible" runat="server"></asp:Label>
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
    <div>
         <asp:DataList runat="server" ID="dataListTrayectos" OnItemCommand="btnVerParticipar_Click"
                ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%">
                <AlternatingItemStyle BackColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                <HeaderTemplate>
                    <div class="divCeldaTrayecto">Parada Origen</div>
                    <div class="divCeldaTrayecto">Parada Destino</div>
                    <div class="divCeldaTrayecto">Cupos</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="divCeldaTrayecto">
                        <asp:Label ID="lblNumeroParada" runat="server" Text='<%# Eval("ParadaOrigen.Direccion") %>'></asp:Label>
                    </div>
                    <div class="divCeldaTrayecto">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ParadaDestino.Direccion") %>'></asp:Label>
                    </div>
                    <div class="divCeldaTrayecto">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CuposDisponibles") %>'></asp:Label>
                    </div>
                    <div>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:LinkButton ID="linkSolicitarCupos" ClientIDMode="Static" runat="server" Text="Participar" CommandArgument='<%# Eval("IdTrayecto") %>' CommandName="participar"></asp:LinkButton>        
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>
                </ItemTemplate>
            </asp:DataList>
    </div>

    <div id="contenedorMapa">Google Map</div>
    <asp:PlaceHolder ID="contenedorHiddenFields" runat="server"></asp:PlaceHolder>
</asp:Content>
