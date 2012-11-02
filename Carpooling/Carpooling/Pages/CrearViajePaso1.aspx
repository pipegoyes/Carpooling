<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearViajePaso1.aspx.cs" Inherits="Carpooling.CrearViajePaso1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/CrearViajePaso1.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="../Scripts/CrearViajePaso1.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <ContentTemplate>
        <div id="divPaso1">
            <div class="titulo">Paso 1. Crear ruta de viaje</div>
            <div class="text">Seleccione las ciudades de origen, destino y paradas (si aplica)</div>
            <div>
                <div>
                    <div class="leftPosition centerDivs elemento">
                        <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
                        <div><asp:TextBox ID="txbCiudadOrigen" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="leftPosition centerDivs elemento">
                        <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
                        <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
                    </div>
                    <div class="divClear"></div>
                </div>
                <div class="leftPosition centerDivs elemento" onclick="CrearParada()">Agregar parada</div>
                <div class="divMediaLinea"></div>
                <div class="divClear"></div>
                        
                <div id="contenedorParadas">
                </div>

                <div id="btnConstruirMapa" onclick="GenerarRuta()">Crear Ruta</div>
                <div id="contenedorMapa">Mapa</div>
                <div id="btnSiguientePaso" class="botones" onclick="">Boton siguiente</div>
            </div>
        </div>
                        

              <div id="divPaso2">
                  <div class="titulo">Paso 2. Datos del viaje</div>
                <div class="text">Configura todos los datos de tu viaje</div>
    
    
                <div id="contenedorRutaViaje" class="contenedorElementos">
                    <div class="creacionElemento2 centerDivs">
                        <div class="subtitulo">Ruta de viaje</div>
                    </div>
                    <div id="divInfoPaso2">
                        
                    </div>
                    <%--<div class="creacionElemento2 centerDivs">
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
                    </div>--%>
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
                <%--<div id="btnPublicar"  class="rightPosition">Publicar</div>--%>
                <div id="btnAtras" class="botones">Atras</div>
                <div id="btnPublicar" class="botones">
                    <asp:Button ID="Button1" CssClass="rightPosition" Text="Publicar" OnClick="BtnPublicarClick" runat="server"/>    
                </div>
              </div>      
    </ContentTemplate>
</asp:Content>
