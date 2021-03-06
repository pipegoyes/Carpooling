﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="EditarViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.EditarViaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/PublicarViaje.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
    <script src="../../Scripts/front-js/EditarViaje.js" type="text/javascript"> </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="divPaso1">
        <div class="titulo">Paso 1. Crear ruta de viaje</div>
        <div class="text">Seleccione las ciudades de origen, destino y paradas (si aplica)</div>
        <div id="divContenedorCiudades" class="leftPosition">
            <div class="subtitulo textLeft">Ruta de viaje</div>
            <div class="labelCiudad">Origen</div>
            <asp:TextBox ID="txbCiudadOrigen" runat="server" CausesValidation="False" ></asp:TextBox>

            <div class="labelCiudad">Destino</div>
            <asp:TextBox ID="txbCiudadDestino" runat="server" CausesValidation="False" ></asp:TextBox>
            <div class="leftPosition dviRefresh" onclick=" GenerarRuta(); "></div>
            <div id="btnAgregarParada" onclick=" CrearParada(); " class="button-gradient blue rightPosition">Agregar parada</div>
            
            <div class="divClear"></div>
                        
            <div id="contenedorParadas">
                <%--aqui van las paradas--%>
            </div>
        </div>
        <div id="contenedorMapa" class="leftPosition">Mapa</div>
        <div class="divClear"></div>
        <div id="btnSiguientePaso" ClientID="btnSiguientePaso" class="button-gradient green rightPosition" >Siguiente</div>
    </div>             

    <div id="divPaso2">
        <div class="titulo">Paso 2. Datos del viaje</div>
        <div class="text">Configura todos los datos de tu viaje</div>
        <div id="contenedorRutaViaje">
            <div class="centerDivs">
                <div class="subtitulo">Ruta de viaje</div>
            </div>
            <div id="divInfoPaso2">
                <%--aqui va la informacion del primer paso--%>
            </div>
        </div>
    
        <div class="subtitulo">Informacion basica</div>
        <div id="divFecha">
            <div class="labelInformacionBasica leftPosition ">Fecha de partida*</div>
            <div class="txbInformacionBasica leftPosition ">
                <asp:TextBox ID="txbFechaPartida" runat="server"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="validadorFechaPartida" ControlToValidate="txbFechaPartida" ValidationGroup="grupoPaso2"
                                        Display="None" ErrorMessage="<b>Valor requerido</b><br>La Fecha de partida es un dato requerido</br>" runat="server"/> 
            <ajaxToolkit:ValidatorCalloutExtender 
                runat="Server"
                ID="ajaxValidatorFechaPartida"
                TargetControlID="validadorFechaPartida"
                HighlightCssClass="errorValidacion" />
            <div class="divClear"></div>
        </div>
            
            
        <div id="divTarifa">
            <div class="labelInformacionBasica leftPosition">AporteEconomico contributiva*</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txbTarifa" runat="server" Width="150px"></asp:TextBox>   
            </div>
            <asp:RequiredFieldValidator ID="validadorTarifa" ValidationGroup="grupoPaso2" ControlToValidate="txbTarifa" Display="None" ErrorMessage="<b>Valor requerido</b><br>La AporteEconomico es un dato requerido</br>" runat="server"/> 
            <ajaxToolkit:ValidatorCalloutExtender 
                runat="Server"
                ID="ajaxValidatorTarifa"
                TargetControlID="validadorTarifa" 
                Width="350px"
                HighlightCssClass="invalidValue" 
                CssClass="CustomValidatorCalloutStyle"
                PopupPosition="Right"
                WarningIconImageUrl="/Styles/images/warning.gif"/>
            <div class="divClear"></div>
        </div>
            
            
        <div id="divHora">
            <div class="labelInformacionBasica leftPosition ">Hora de partida*</div>
            <div class="txbInformacionBasica leftPosition ">
                <asp:TextBox runat="server" ID="txbHora" Width="150px"></asp:TextBox>
            </div>
            <div class="divClear"></div>
        </div>


        <div id="divCupos">
            <div class="leftPosition labelInformacionBasica">Cupos*</div>
            <div class="leftPosition txbInformacionBasica">
                <asp:TextBox ID="txbCupos" runat="server" name="value" Width="150px"></asp:TextBox>    
            </div>
            <div class="divClear"></div>
        </div>
        <div id="dialog-message" title="Publicación Exitosa" style="display: none">
            <p>
                <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
                Tu viaje ya ha sido publicado, ahora ya eres parte de la comunidad de Carpooling Colombia !
            </p>
        </div>
        <asp:UpdatePanel runat="server" ID="upBotonGuardar" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="btnAtras" class="button-gradient green leftPosition">Atras</div>
                <asp:Button runat="server" ID="btnCancelar" CssClass="button-gradient blue rightPosition btnCancelar" Text="Cancelar" OnClick="BtnCancelarClick"  />
                <asp:Button runat="server" Text="GuardarCambios" OnClientClick=" guardarCambiosViaje(); " CssClass="button-gradient green rightPosition" ID="btnGuardarCambios"/>
                 
            </ContentTemplate>
        </asp:UpdatePanel>
        
            
        <div class="divClear"></div>
            
    </div>
    <asp:HiddenField runat="server" ID="hfIdViajeEditable"/>
</asp:Content>