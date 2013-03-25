        <%@ Page Title="" Language="C#" MasterPageFile="/Front/Site.Master" AutoEventWireup="true" CodeBehind="PublicarViaje.aspx.cs" 
        Inherits="Carpooling.Front.Viajes.PublicarViaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/CrearViajePaso1.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="/Scripts/PublicarViaje.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript" src="/Scripts/CreacionComponentes.js"></script>
    
    <script type="text/javascript" src="/Scripts/jqueryUI/globalize.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
<%--    <ContentTemplate>--%>
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
                <div id="btnSiguientePaso" class="boton rightPosition">Boton siguiente</div>
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
                <div class="labelInformacionBasica leftPosition ">Fecha de partida*</div>
                <div class="txbInformacionBasica leftPosition ">
                    <asp:TextBox ID="txbFechaPartida" runat="server"></asp:TextBox>
                </div>
                 <asp:RequiredFieldValidator ID="validadorFechaPartida" ControlToValidate="txbFechaPartida" Display="None" ErrorMessage="<b>Valor requerido</b><br>La Fecha de partida es un dato requerido</br>" runat="server"/> 
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
                <div class="labelInformacionBasica leftPosition">Rol*</div>
                <div class="txbInformacionBasica leftPosition">
                     <div id="roles">
                        <asp:RadioButton runat="server" ID="btnRolConductor" Text="Conductor" Checked="True" CssClass="leftPosition" GroupName="rol"/>
                        <asp:RadioButton runat="server" ID="btnRolPasajero" Text="Pasajero" GroupName="rol" CssClass="leftPosition"/>
                    </div>
                    
                </div>
                <div class="divClear"></div>
            </div>
            <div id="divTarifa">
                <div class="labelInformacionBasica leftPosition">AporteEconomico contributiva*</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbTarifa" runat="server" value="10000"></asp:TextBox>   
                </div>
                <asp:RequiredFieldValidator ID="validadorTarifa" ControlToValidate="txbTarifa" Display="None" ErrorMessage="<b>Valor requerido</b><br>La AporteEconomico es un dato requerido</br>" runat="server"/> 
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
                     <asp:TextBox runat="server" ID="txbHora" value="08:30 PM"></asp:TextBox>
                </div>
                <div class="divClear"></div>
            </div>


            <div id="divCupos">
                <div class="leftPosition labelInformacionBasica">Cupos*</div>
                <div class="leftPosition txbInformacionBasica">
                    <asp:TextBox ID="txbCupos" runat="server" name="value" value="1"></asp:TextBox>    
                </div>
                <div class="divClear"></div>
            </div>
            <div id="dialog-message" title="Download complete" style="display: none">
                <p>
                    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
                    Tu viaje ha sido creado exitosamente, ahoraPartidaStr ya eres parte de la comunidad de Carpooling !
                </p>
                <p>
                    Currently using <b>36% of your storage space</b>.
                </p>
            </div>

            <div id="btnAtras" class="boton leftPosition">Atras</div>
            <asp:Button ID="btnPublicar"  CssClass="rightPosition" OnClientClick="publicarViaje();" Text="Publicar" runat="server"/>
            <div class="divClear"></div>
            <%--<div id="btnPublicar" class="boton rightPosition" onclick="publicarViaje()" >Publicar</div>--%>
        </div>      
    <%--</ContentTemplate>--%>
</asp:Content>
