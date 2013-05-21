<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje_MisViajes.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje_MisViajes" %>
<%@ Register TagPrefix="uc" TagName="PopUpConfirmation" Src="~/Front/UserControls/PopUpOk.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"> </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"> </script>
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
    <uc:PopUpConfirmation ID="popUpConfirmation" runat="server" />
    
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
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Direccion") %>'></asp:Label>
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
    <div id="contenedorTrayectos">
         <asp:DataList runat="server" ID="dataListTrayectos" 
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
                    <%--<div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:LinkButton ID="linkSolicitarCupos" ClientIDMode="Static" runat="server" Text="Participar" CommandArgument='<%# Eval("IdTrayecto") %>' CommandName="participar"></asp:LinkButton>        
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>--%>
                </ItemTemplate>
            </asp:DataList>
    </div>

    <asp:Panel ID="PanelSolicitudesDetalle" runat="server" >
        <div class="subtitulo">Listado de solicitudes</div>
        <asp:DataList ID="dataListSolicitudes" runat="server" ForeColor="#333333" RepeatColumns="1"
                      ShowFooter="False" Width="100%" OnItemCommand="BtnAceptarSolicitud">
            <AlternatingItemStyle BackColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                         ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
            <HeaderTemplate>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label3" runat="server" Text="Solicitante"></asp:Label>
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
                    <asp:Label ID="Label7"  runat="server" Text="Cupos disponibles"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label8" runat="server" Text="Comentario"></asp:Label>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("NombreSolicitante") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("CiudadOrigen") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("CiudadDestino") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("CuposSolicitados") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("CuposDisponibles") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("Comentario") %>'></asp:Label>
                </div>
                <div>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Aceptar" CommandName="aceptarSolicitud" CommandArgument='<%# Eval("IdSolicitud") %>'></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" Text="Rechazar" CommandName="rechazarSolicitud" CommandArgument='<%# Eval("IdSolicitud") %>'></asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div>
            <div id="divSinSolicitudes">
                <asp:Label runat="server" Text="No hay solicitudes pendientes" ID="lblSinSolicitudes"></asp:Label>    
            </div>
        </div>
    </asp:Panel>
    
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
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("NombreSolicitante") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("CiudadOrigen") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("CiudadDestino") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("CuposSolicitados") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Reputacion") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("Comentario") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div>
            <div id="div1">
                <asp:Label runat="server" Text="Aun no hay participantes para el viaje." ID="lblSinParticipantes"></asp:Label>    
            </div>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="PanelPreguntas" runat="server" >
        <div class="subtitulo">Listado de preguntas</div>
        <asp:DataList ID="dataListPreguntas" runat="server" ForeColor="#333333" RepeatColumns="1"
                      ShowFooter="False" Width="100%" OnItemCommand="BtnResponderClick">
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
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("NombreCreador") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("TextoPregunta") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("TextoRespuesta") %>'></asp:Label>
                </div>
                <asp:LinkButton runat="server" Text="Responder" CommandName="responder" CommandArgument='<%# Eval("IdPregunta") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>
        <div>
            <div id="div2">
                <asp:Label runat="server" Text="Aun no existen preguntas por responder" ID="lblSinPreguntas"></asp:Label>    
            </div>
        </div>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlResponder" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeResponder" PopupControlID="pnlResponder"
                                    TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackgroundMensajeModal" >
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>
    <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="popUpContainer" class="popUpContainer">
                <div id="divEncabezado" class="divEncabezado">
                    <asp:Label runat="server" ID="lblTitulo" Text="Responder la pregunta"></asp:Label> 
                </div>
                <div id="mainContentPopUp" class="mainContentPopUp">
                    <div>
                        <asp:Label runat="server" ID="lblPregunta"></asp:Label>
                    </div>
                    <div>
                        <div class="labelRespuesta">
                            <asp:Label ID="Label15" runat="server" Text="Respuesta"></asp:Label>    
                        </div>
                        
                        <asp:TextBox ID="txbRespuesta" runat="server" Rows="4" TextMode="MultiLine" ></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblRespuesta" Visible="False"></asp:Label>
                    </div>
                    <%--Divs de respuesta de la transaccion--%>
                    <asp:Panel ID="panelError" class="ui-widget" runat="server" Visible="False" Width="450px">
                        <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                            <p>
                                <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                <strong>Alert:</strong>
                                <asp:Label ID="lblMensajeError" runat="server" Text="Su respuesta no ha podido ser actualizada, por favor intente de nuevo."></asp:Label>
                            </p>
                        </div>
                    </asp:Panel>
                    <asp:Panel class="ui-widget"  runat="server" ID="panelExitoso" Visible="False" Width="450px">
                        <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                            <p>
                                <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                                <strong class="divWithoutShadow">Hey!</strong>
                                <asp:Label ID="lblMensajeExitoso" runat="server" CssClass="divWithoutShadow" Text="Su respuesta ha sido actualizada."></asp:Label>
                            </p>
                        </div>
                    </asp:Panel>

                    <div id="divBotonesPopUp" class="divBotonesPopUp">
                        <asp:Button runat="server" ID="btnOk" CssClass="button-gradient green" Text="Aceptar" OnClick="BtnConfirmarRespuesta" />
                        <asp:Button runat="server" ID="btnCancel" CssClass="button-gradient blue" Text="Cancelar" OnClick="BtnCancelarPopUp" />    
                    </div>
                    <div class="divClear"></div>
                
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
    
    <div id="contenedorMapa">Google Map</div>
    <asp:PlaceHolder ID="contenedorHiddenFields" runat="server"></asp:PlaceHolder>
    
    <div>
        <asp:Button runat="server" Text="Cancelar Viaje" CssClass="button-gradient blue rightPosition" OnClick="BtnCancelarViaje"/>
    </div>

    <asp:Panel runat="server" ID="pnlConfirmarCancelacion" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeConfirmarCancelacion" PopupControlID="pnlConfirmarCancelacion"
                                    TargetControlID="lblCC" BackgroundCssClass="modalBackgroundMensajeModal" CancelControlID="btnCancelConfirmacionPopUp" >
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblCC"></asp:Label>
    <asp:UpdatePanel  ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="Div3" class="popUpContainer">
                <div id="div4" class="divEncabezado">
                    <asp:Label runat="server" ID="Label17" Text="Cancelación del viaje"></asp:Label> 
                </div>
                <div id="Div5" class="mainContentPopUp">
                    <div>
                        <asp:Label runat="server" ID="Label18" Text="¿Estas seguro que deseas cancelar el viaje?"></asp:Label>
                    </div>
                    <div>
                        <asp:Panel ID="panelMensajeCancelacionPopup" class="ui-widget" runat="server" Visible="False" Width="450px">
                        <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                            <p>
                                <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                <strong>Tenga en cuenta:</strong>
                                <asp:Label ID="Label16" runat="server" Text="Esta accion no se puede reversar"></asp:Label>
                            </p>
                        </div>
                    </asp:Panel>
                    </div>

                    <div id="div6" class="divBotonesPopUp">
                        <asp:Button runat="server" ID="btnAceptarCancelacionPopUp" CssClass="button-gradient green" Text="Aceptar" OnClick="BtnCancelacionConfirmada" />
                        <asp:Button runat="server" ID="btnCancelConfirmacionPopUp" CssClass="button-gradient blue" Text="Cancelar"  />    
                    </div>
                    <div class="divClear"></div>
                
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
</asp:Content>
