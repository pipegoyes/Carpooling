<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje" %>
<%@ PreviousPageType VirtualPath="BuscarViaje.aspx" %>
<%@ Register tagPrefix="uc" tagName="PopUpConfirmation" src="../UserControls/PopUpOk.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
    <script src="../../Scripts/front-js/DetalleViaje.js" type="text/javascript" > </script>
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
                        <asp:Label runat="server" Text='<%#Eval("Direccion") %>'></asp:Label>
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
        <asp:DataList runat="server" ID="dataListTrayectos" OnItemCommand="ShowPopUpParticipar"
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
                            <asp:LinkButton ID="linkSolicitarCupos" ClientIDMode="Static" runat="server" Text="Participar" CommandArgument='<%#Eval("IdTrayecto") %>' CommandName="participar"></asp:LinkButton>        
                        </ContentTemplate>
                    </asp:UpdatePanel>
                        
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    
    <div>
        <asp:Button runat="server" Text="Preguntar" CssClass="button-gradient blue" OnClick="ShowPopUpRespuesta"/>
    </div>
    <div id="contenedorMapa">Google Map</div>
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
                    <div id="div2" class="divEncabezado">
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