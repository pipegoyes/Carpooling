﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearViajePaso1.aspx.cs" Inherits="Carpooling.CrearViajePaso1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/CrearViajePaso1.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="../Scripts/CrearViajePaso1.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <ContentTemplate>
        <div id="divPaso1">
            <div class="titulo">Paso 1. Crear ruta de viaje</div>
            <div class="text">Seleccione las ciudades de origen, destino y paradas (si aplica)</div>
            <div>
                <div>
                    <div class="leftPosition centerDivs elementoPaso1">
                        <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
                        <div><asp:TextBox ID="txbCiudadOrigen" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="leftPosition centerDivs elementoPaso1">
                        <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
                        <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
                    </div>
                    <div class="divClear"></div>
                </div>
                <div class="leftPosition centerDivs elementoPaso1" onclick="CrearParada()">Agregar parada</div>
                <div class="divMediaLinea"></div>
                <div class="divClear"></div>
                        
                <div id="contenedorParadas">
                </div>

                <div id="btnConstruirMapa" onclick="GenerarRuta()">Crear Ruta</div>
                <div id="contenedorMapa">Mapa</div>
                <div id="btnSiguientePaso" class="boton rightPosition" onclick="">Boton siguiente</div>
            </div>
        </div>
                        

        <div id="divPaso2">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
            
            <div>
                <div class="labelInformacionBasica leftPosition">Rol*</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbRol" runat="server"></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="validadorRol" ControlToValidate="txbRol" Display="None" ErrorMessage="<b>Valor requerido</b><br>Viajero o Pasajero</br> " runat="server"/> 
                    <ajaxToolkit:ValidatorCalloutExtender 
                    runat="Server"
                    ID="ajaxValidatorRol"
                    TargetControlID="validadorRol" 
                    Width="350px"
                    HighlightCssClass="invalidValue" 
                    CssClass="CustomValidatorCalloutStyle"
                    PopupPosition="Right"
                    WarningIconImageUrl="~/Resources/warning.gif"/>
                </div>
                <div class="divClear"></div>
            </div>
            <div>
                <div class="labelInformacionBasica leftPosition">Tarifa contributiva*</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbTarifa" runat="server"></asp:TextBox>   
                </div>
                <asp:RequiredFieldValidator ID="validadorTarifa" ControlToValidate="txbTarifa" Display="None" ErrorMessage="La Tarifa es un dato requerido" runat="server"/> 
                    <ajaxToolkit:ValidatorCalloutExtender 
                    runat="Server"
                    ID="ajaxValidatorTarifa"
                    TargetControlID="validadorTarifa" 
                    Width="350px"
                    HighlightCssClass="invalidValue" 
                    CssClass="CustomValidatorCalloutStyle"
                    PopupPosition="Right"
                    WarningIconImageUrl="~/Resources/warning.gif"/>
                <div class="divClear"></div>
            </div>
            <div>
                <div class="labelInformacionBasica leftPosition ">Fecha de partida*</div>
                <div class="txbInformacionBasica leftPosition ">
                    <asp:TextBox ID="txbFechaPartida" runat="server"></asp:TextBox>   
                    <ajaxToolkit:CalendarExtender runat="server" TargetControlID="txbFechaPartida" PopupPosition="Right"/> 
                </div>
                 <asp:RequiredFieldValidator ID="validadorFechaPartida" ControlToValidate="txbFechaPartida" Display="None" ErrorMessage="La Fecha de partida es un dato requerido" runat="server"/> 
                    <ajaxToolkit:ValidatorCalloutExtender 
                    runat="Server"
                    ID="ajaxValidatorFechaPartida"
                    TargetControlID="validadorFechaPartida" 
                    Width="350px"
                    HighlightCssClass="invalidValue" 
                    CssClass="CustomValidatorCalloutStyle"
                    PopupPosition="Right"
                    WarningIconImageUrl="~/Resources/warning.gif"/>
                <div class="divClear"></div>
            </div>
            <div>
                <div class="leftPosition labelInformacionBasica">Cupos*</div>
                <div class="leftPosition txbInformacionBasica">
                    <asp:TextBox ID="txbCupos" runat="server"></asp:TextBox>    
                </div>
                <asp:RequiredFieldValidator ID="validadorCupos" ControlToValidate="txbCupos" Display="None" ErrorMessage="El numero de cupos es un dato requerido" runat="server"/> 
                    <ajaxToolkit:ValidatorCalloutExtender 
                    runat="Server"
                    ID="ajaxValidatorCupos"
                    TargetControlID="validadorCupos" 
                    Width="350px"
                    HighlightCssClass="invalidValue" 
                    CssClass="CustomValidatorCalloutStyle"
                    PopupPosition="Right"
                    WarningIconImageUrl="~/Resources/warning.gif"/>
                <div class="divClear"></div>
            </div>


            <div id="btnAtras" class="boton leftPosition">Atras</div>
            <asp:Button ID="btnPublicar" CssClass="rightPosition" OnClientClick="publicarViaje();" Text="Publicar" runat="server"/>
            <div class="divClear"></div>
            <%--<div id="btnPublicar" class="boton rightPosition" onclick="publicarViaje()" >Publicar</div>--%>
        </div>      
    </ContentTemplate>
</asp:Content>
