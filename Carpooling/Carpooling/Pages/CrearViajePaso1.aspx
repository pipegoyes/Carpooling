<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearViajePaso1.aspx.cs" Inherits="Carpooling.CrearViajePaso1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/CrearViajePaso1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/CrearViajePaso1.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <link href="/Styles/NuevaCuenta.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var pbControl = null;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            pbControl = args.get_postBackElement();  //the control causing the postback 
            pbControl.disabled = true;
        }
        function EndRequestHandler(sender, args) {
            pbControl.disabled = false;
            pbControl = null;
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:UpdatePanel ID="CrearViajePanel" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="ViewRuta" runat="server">
                    <div class="titulo">Paso 1. Crear ruta de viaje</div>
                    <div class="text">Seleccione las ciudades de origen, destino y paradas (si aplica)</div>
                    <div>
                        <div class="creacionElemento">
                            <div><asp:Label ID="lblCiudadOrigen" runat="server" Text="Ciudad de Origen:"></asp:Label> </div>
                            <div><asp:TextBox ID="txbCiudadOrigen" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="creacionElemento">
                            <div><asp:Label ID="lblCiudadDestino" runat="server" Text="Ciudad de destino:"></asp:Label></div>
                            <div><asp:TextBox ID="txbCiudadDestino" runat="server" ></asp:TextBox></div>
                        </div>
                        <div class="creacionElemento">
                            <asp:ImageButton ID="ImageButton1" ImageUrl="../Resources/btnAgregarParadas.png" runat="server"/>
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
                                    <asp:TextBox ID="txbParada2" runat="server"></asp:TextBox>
                                </div>
                                <div class="btnEliminar leftPosition"></div>
                                <div class="divClear"></div>
                            </div>
                            <div class="paradaElemento">
                                <div class="labelParadas leftPosition">
                                    <asp:Label ID="Label2" Text="Parada 3" runat="server"></asp:Label>
                                </div>
                                <div class="leftPosition">
                                    <asp:TextBox ID="txbParada3" runat="server"></asp:TextBox>
                                </div>
                                <div class="btnEliminar leftPosition"></div>
                                <div class="divClear"></div>
                            </div>
                            <div id="btnConstruirMapa" onclick="GenerarRuta()">Crear Ruta</div>
            
                            <div class="titulo">Verifique su ruta</div>
                            <div id="contenedorMapa">Mapa</div>
                            <div class="divRelleno"></div>
                            <%--<div id="btnSiguientePaso"class="rightPosition">Siguiente paso</div>--%>
                            <div class="botones">
                                <asp:Button ID="btnSiguientePaso" CssClass="rightPosition"  Text="Siguiente paso" OnClick="BtnSiguientePasoClick" runat="server"/>    
                            </div>
                        </div>
                    </div>        

                </asp:View>
                <asp:View ID="ViewDatosViaje" runat="server">
              
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
                    <%--<div id="btnPublicar"  class="rightPosition">Publicar</div>--%>
                    <div class="botones">
                        <asp:Button ID="btnAtras2" Text="Atras" OnClick="BtnAtras" runat="server"/>
                        <asp:Button ID="btnPublicar" CssClass="rightPosition" Text="Publicar" OnClick="BtnPublicarClick" runat="server"/>    
                    </div>
                    
                </asp:View>  
                <asp:View ID="ViewPublicacionExitosa" runat="server">
                    <div class="titulo">Publicacion exitosa</div>
                    <div id="DivRutaViaje" class="leftPosition">
                        <div class="subtitulo">Ruta de viaje</div>
                        <div class="leftPosition contenedorSecundarioRV">
                            <div class="leftPosition labelRutaViaje">Desde</div>
                            <div class="leftPosition textoRutaViaje">
                                <asp:Label ID="Label3" Text="Bogota" runat="server"></asp:Label>
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
    
                    <div id="DivDivDatosViaje" class="leftPosition">
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
                                <asp:Label ID="Label4" Text="$65.000 Col" runat="server"></asp:Label>
                            </div>
                            <div class="divClear"></div>
                        </div>
                        <div>
                            <div class="leftPosition labelDatosViaje">Cupos</div>
                            <div class="leftPosition">
                                <asp:Label ID="Label5" Text="3 Sillas" runat="server"></asp:Label>
                            </div>
                            <div class="divClear"></div>
                        </div>
                        <div class="subtitulo">Datos adicionales</div>
                        <div>
                            <div>Comentario</div>
                            <div>
                                <asp:Label ID="Label6"  Text="Se permite fumar, se requiere una previa llamada para confimar" runat="server"></asp:Label>
                            </div>
    
                        </div>
        
                    </div>
                    <div class="divClear"></div>
                    <div id="Div2">Google Map</div>
                </asp:View>
            </asp:MultiView>  
        </ContentTemplate>
        
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnPublicar" EventName="Click"/>
            <asp:AsyncPostBackTrigger ControlID="btnSiguientePaso" EventName="Click"/>
            <asp:AsyncPostBackTrigger ControlID="btnAtras2" EventName="Click"/>
        </Triggers>

    </asp:UpdatePanel>
    
</asp:Content>
