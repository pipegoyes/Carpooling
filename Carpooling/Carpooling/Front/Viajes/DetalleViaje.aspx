<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje" %>
<%@ PreviousPageType VirtualPath="BuscarViaje.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
    <script src="../../Scripts/front-js/DetalleViaje.js" type="text/javascript" > </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Detalle del viaje.</h1>
            </hgroup>
            <p>
                <h2>Toda la información que necesitas para participar del Carpooling.</h2>
            </p>
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
   <div id="divLeftSection">
        <table cellpadding="2px" cellspacing="0">
            <tr>
                <td class="tituloLabelDV">Fecha</td>
                <td class="marginLeft"><asp:Label ID="txtFechaViaje" CssClass="marginLeft"  Text="Sin Fecha" runat="server"></asp:Label></td>
            </tr>
            <tr class="">
                <td class="tituloLabelDV">Origen</td>
                <td class="marginLeft" style="background-color: white;"><asp:Label runat="server" ID="txbOrigen" CssClass="marginLeft" BackColor="white"></asp:Label></td>
            </tr>
            <tr>
                <td class="tituloLabelDV">Destino</td>
                <td><asp:Label runat="server" ID="txbDestino" CssClass="marginLeft"></asp:Label></td>
            </tr>
            <tr>
                <td class="tituloLabelDV">Tarifa</td>
                <td style="background-color: white;"><asp:Label ID="txtTarifa" Text="No disponible" runat="server" CssClass="marginLeft" ></asp:Label></td>
            </tr>
        </table>
        <div class="divClear"></div>
        <div id="divBotones" class="divBotones">
            <asp:Button ID="btnPreguntar" runat="server" Text="Preguntar" OnClick="ShowPopUpRespuesta" CssClass="button-gradient green" />
        </div>
        <div class="divClear"></div>
        <div>
            <div class="subtitulo textLeft">Ruta de viaje</div>
            <div>
                <asp:DataList runat="server" ID="dataListParada" 
                              ForeColor="#333333" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="100%">
                    <AlternatingItemStyle BackColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemTemplate>
                        <div class="rutaViajeParada">
                            <asp:Label ID="lblNumeroParada" runat="server" Text='<%#                                        Eval("NumeroParada") %>'></asp:Label>
                        </div>
                        <div class="leftPosition">
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval
                                                                                                   ("Direccion") %>'></asp:Label>
                        </div>
                        <div class="divClear"></div>
                    </ItemTemplate>
                </asp:DataList>
                
            </div>
        </div>
        <div class="divClear"></div>
        <div id="contenedorInfoConductor">
            <div class="subtitulo textLeft">Conductor</div>
            <asp:Label runat="server" ID="txbNombreConductor"></asp:Label>
        </div>
        <div id="contenedorTrayectos">
            <div class="subtitulo textLeft">Trayectos</div>
            <asp:DataList runat="server" ID="dataListTrayectos" 
                          ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="ShowPopUpParticipar">
                <AlternatingItemStyle BackColor="White"  />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                <HeaderTemplate>
                    <div class="leftPosition divHeaderOrigenDestino">Origen y Destino</div>
                    <div class="rightPosition divHeaderCupos">Cupos</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="leftPosition">
                        <div>
                            <asp:Label ID="lblNumeroParada" runat="server" Text='<%#                                        Eval("ParadaOrigen.Direccion") %>'></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label1" runat="server" Text='<%#                                        Eval("ParadaDestino.Direccion") %>'></asp:Label>
                        </div>
                    </div>
                    <asp:LinkButton ID="linkSolicitarCupos" ClientIDMode="Static" runat="server" Text="Participar" CommandArgument='<%#Eval("IdTrayecto") %>' CommandName="participar"></asp:LinkButton>        
                    <div class="rightPosition divCupos">
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("CuposDisponibles") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div> 
    </div>
    <div id="divRightSection">
        
        <div id="tabsDetalleViaje">
            <ul>
                <li><a href="#tabMapa">Mapa</a></li>
                <li><a href="#tabParticipantes" runat="server">Participantes</a></li>
                <li><a href="#tabPreguntas" runat="server">Preguntas</a></li>
            </ul>
            <div id="tabParticipantes" class="scrollY">
                <asp:Panel ID="PanelParticipantes" runat="server" >
                    <div class="subtitulo">Listado de participantes</div>
                    <asp:DataList ID="dataListParticipantes" runat="server" ForeColor="#333333" RepeatColumns="1"
                                  ShowFooter="False" Width="100%" >
                        <AlternatingItemStyle BackColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                        <HeaderTemplate>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label3" runat="server" Text="Participante"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label4" runat="server" Text="Ciudad origen"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label5"  runat="server" Text="Ciudad destino"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label6"  runat="server" Text="Cupos solicitados"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label7"  runat="server" Text="Reputacion"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label8" runat="server" Text="Comentario"></asp:Label>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("NombreSolicitante") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("CiudadOrigen") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("CiudadDestino") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label12" runat="server" Text='<%#Eval("CuposSolicitados") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label13" runat="server" Text='<%#Eval("Reputacion") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label14" runat="server" Text='<%#Eval("Comentario") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <div>
                        <div id="div1">
                            <asp:Label runat="server" Text="Aun no hay participantes para el viaje." ID="lblSinParticipantes"></asp:Label>    
                        </div>
                    </div>
                </asp:Panel>    
            </div>
            <div id="tabPreguntas" class="scrollY">
                <asp:Panel ID="PanelPreguntas" runat="server" >
                    <div class="subtitulo">Listado de preguntas</div>
                    <asp:DataList ID="dataListPreguntas" runat="server" ForeColor="#333333" RepeatColumns="1"
                                  ShowFooter="False" Width="100%" >
                        <AlternatingItemStyle BackColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                        <HeaderTemplate>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label3" runat="server" Text="Creador"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label4" runat="server" Text="Pregunta"></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label5"  runat="server" Text="Respuesta"></asp:Label>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("NombreCreador") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("TextoPregunta") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("TextoRespuesta") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <div>
                        <div id="div2">
                            <asp:Label runat="server" Text="Aun no existen preguntas por responder" ID="lblSinPreguntas"></asp:Label>    
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div id="tabMapa">
                <div id="contenedorMapa">Google Map</div>    
            </div>
        </div>
    </div>
    <asp:PlaceHolder ID="contenedorHiddenFields" runat="server"></asp:PlaceHolder>
    <%--El popup para ingresar el numero de cupos--%>
    <asp:Panel runat="server" ID="pnlConfirmarCupos" Style="display: none;">
        <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeMensajes" PopupControlID="pnlConfirmarCupos"
                                        TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackgroundMensajeModal" >
        </ajaxToolkit:ModalPopupExtender>
        <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>
        <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="popUpContainer" class="popUpContainer">
                    <div id="divEncabezado" class="divEncabezado">
                        <asp:Label runat="server" ID="lblTitulo" Text="Confirmar numero de cupos"></asp:Label>
                    </div>
                    <div id="mainContentPopUp" class="mainContentPopUp">
                        <div>
                            <asp:Label runat="server" ID="lblTextoMensaje" Text="Ingrese el numero de cupos a solicitar"></asp:Label>
                            <asp:TextBox ID="txbCuposSolicitados" runat="server" CssClass="txbCuposSolicitados"></asp:TextBox>
                        </div>
            
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Comentario"></asp:Label>
                            <asp:TextBox ID="txbComentario" runat="server" TextMode="MultiLine" Rows="3" ></asp:TextBox>
                        </div>
                        <%--Divs de respuesta de la transaccion--%>
                        <asp:Panel ID="panelError" class="ui-widget" runat="server" Visible="False" Width="450px">
                            <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                                <p>
                                    <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                    <strong>Alert:</strong>
                                    <asp:Label ID="lblMensajeError" runat="server" Text="No puedes enviar mas de una solicitud para un mismo trayecto."></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                        <asp:Panel class="ui-widget"  runat="server" ID="panelExitoso" Visible="False" Width="450px">
                            <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                                <p>
                                    <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                                    <strong class="divWithoutShadow">Hey!</strong>
                                    <asp:Label ID="lblMensajeExitoso" runat="server" CssClass="divWithoutShadow" Text="Su solicitud fue enviada exitosamente. Recuerda que el propietario es el que finalmente decidi si eres aceptado dentro del viaje"></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                        <div class="divBotonesPopUp">
                            <asp:Button runat="server" ID="btnAceptarPopUp" Text="Aceptar" CssClass="button-gradient green" OnClick="BtnEnviarSolicitud"/>
                            <asp:Button runat="server" ID="btnCancelPopUp" Text="Cancelar" CssClass="button-gradient blue" OnClick="HidePopUpParticipar" />    
                        </div>
                        <div class="divClear"></div>
                
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    
    <%--El popup para preguntar--%>
    <asp:Panel runat="server" ID="pnlPreguntar" Style="display: none;">
        <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePreguntar" PopupControlID="pnlPreguntar"
                                        TargetControlID="lblMensajesPopPreguntar" BackgroundCssClass="modalBackgroundMensajeModal" CancelControlID="btnCancelPopUpResponder">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Label runat="server" ID="lblMensajesPopPreguntar"></asp:Label>
        <asp:UpdatePanel  ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="popUpContainer">
                    <div id="div3" class="divEncabezado">
                        <asp:Label runat="server" ID="Label5" Text="Realizar pregunta"></asp:Label>
                    </div>
                    <div class="mainContentPopUp">
                        <div>
                            <asp:Label runat="server" ID="Label6" Text="Escriba la pregunta que desea realizar"></asp:Label>
                            <asp:TextBox ID="txbPregunta" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                        <%--Divs de respuesta de la transaccion--%>
                        <asp:Panel ID="panelPreguntaRespuestaErr" class="ui-widget" runat="server" Visible="False" Width="450px">
                            <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                                <p>
                                    <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                    <strong>Alert:</strong>
                                    <asp:Label ID="Label8" runat="server" Text="No se pudo realizar la pregunta, verifique el campo pregunta."></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                        <asp:Panel class="ui-widget"  runat="server" ID="panelPreguntaRespuestaExt" Visible="False" Width="450px">
                            <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                                <p>
                                    <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                                    <strong class="divWithoutShadow">Hey!</strong>
                                    <asp:Label ID="Label9" runat="server" CssClass="divWithoutShadow" Text="Tu pregunta ha sido enviada, te informaremos cuando tu pregunta sea resuelta."></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                        <div class="divBotonesPopUp">
                            <asp:Button runat="server" ID="btnPreguntarPopUp" Text="Preguntar" CssClass="button-gradient green" OnClick="BtnRealizarPregunta"/>
                            <asp:Button runat="server" ID="btnCancelPopUpResponder" Text="Cancelar" CssClass="button-gradient blue" OnClick="HidePopUpRespuesta" />    
                        </div>
                        <div class="divClear"></div>
                
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>