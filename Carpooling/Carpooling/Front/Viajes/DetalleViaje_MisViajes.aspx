<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="DetalleViaje_MisViajes.aspx.cs" Inherits="Carpooling.Front.Viajes.DetalleViaje_MisViajes" %>
<%@ Register TagPrefix="uc" TagName="PopUpConfirmation" Src="~/Front/UserControls/PopUpOk.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/DetalleViaje.css" type="text/css" rel="stylesheet" />
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
    <uc:PopUpConfirmation ID="popUpConfirmacionSolicitud" runat="server" OnOnClickAceptar="AceptarPopUpSolicitud" />
    <uc:PopUpConfirmation ID="popUpConfirmacionCancelacion" runat="server" OnOnClickAceptar="AceptarPopUpCancelacionRealizada"/>
        
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
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="button-gradient green" />
            <asp:Button ID="Button1" runat="server" Text="Cancelar" CssClass="button-gradient blue" OnClick="BtnCancelarViaje"/>
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
        <div id="contenedorTrayectos">
            <div class="subtitulo textLeft">Trayectos</div>
            <asp:DataList runat="server" ID="dataListTrayectos" 
                          ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" >
                <AlternatingItemStyle BackColor="White" />
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
                <li><a href="#tabSolicitudes" id="tabSolicitudes" runat="server">Solicitudes</a></li>
                <li><a href="#tabParticipantes" id="tabParticipantes" runat="server">Participantes</a></li>
                <li><a href="#tabPreguntas" id="tabPreguntas" runat="server">Preguntas</a></li>
            </ul>
            <div id="tabSolicitudes" class="scrollY">
                <asp:Panel ID="PanelSolicitudesDetalle" runat="server" >
                    <div class="subtitulo">Listado de solicitudes</div>
                    <asp:DataList ID="dataListSolicitudes" runat="server" ForeColor="#333333" RepeatColumns="1"
                                  ShowFooter="False" Width="100%" ShowHeader="False">
                        <AlternatingItemStyle BackColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                        <ItemTemplate>
                            <div class="divContenedorTituloTrayecto">
                                <div class="leftPosition divTituloTrayecto">
                                    <asp:Label ID="Label19" runat="server" Text="Trayecto"></asp:Label>
                                </div>
                                <div class="leftPosition divSubtituloTrayecto">
                                    <div>
                                        <asp:Label ID="Label10" runat="server" Text='<%#                Eval("ParadaOrigen.Direccion") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label11" runat="server" Text='<%#                Eval("ParadaDestino.Direccion") %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="rightPosition divSubtituloCupos">
                                    <asp:Label ID="Label13" runat="server" Text='<%#Eval("CuposDisponibles") %>'></asp:Label>
                                </div>
                                <div class="divClear"></div>
                            </div>
                            <asp:ListView runat="server" ID="listViewSolicitudes" DataSource='<%#Eval("ListaSolicitudes") %>' OnItemCommand="BtnAceptarRechazarSolicitud">
                                <ItemTemplate>
                                    <div class="divSolicitante">
                                        <div class="leftPosition divNombreSolicitante">
                                            <div>
                                                <asp:Label ID="Label20" runat="server" Text='<%#                Eval("CreadorSolicitud.Nombre") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <div class="leftPosition divComentarioSolicitante">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Comentario") %>'></asp:Label>
                                        </div>
                                        <div class="rightPosition">
                                            <asp:Label ID="Label2" runat="server" Text="Cupos solicitados"></asp:Label>
                                            <asp:Label ID="Label21" runat="server" Text='<%#Eval("CuposSolicitados") %>'></asp:Label>
                                        </div>
                                        <div class="divClear"></div>
                                        <div class="leftPosition">
                                            <asp:LinkButton ID="LinkButton2" runat="server" Text="Aceptar" CommandName="aceptarSolicitud" CommandArgument='<%#Eval("IdSolicitud") %>'></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton3" runat="server" Text="Rechazar" CommandName="rechazarSolicitud" CommandArgument='<%#Eval("IdSolicitud") %>'></asp:LinkButton>
                                        </div>
                                        <div class="divClear"></div> 
                                    </div>
                                    <div class="divClear"></div>
                                </ItemTemplate>
                            </asp:ListView>

                        </ItemTemplate>
                    </asp:DataList>
                    

                    <div>
                        <div id="divSinSolicitudes">
                            <asp:Label runat="server" Text="No hay solicitudes pendientes" ID="lblSinSolicitudes"></asp:Label>    
                        </div>
                    </div>
                </asp:Panel>    
            </div>
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
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("NombreCreador") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("TextoPregunta") %>'></asp:Label>
                            </div>
                            <div class="divCeldaSolicitudes">
                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("TextoRespuesta") %>'></asp:Label>
                            </div>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="Responder" CommandName="responder" CommandArgument='<%#Eval("IdPregunta") %>'></asp:LinkButton>
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
        
        <asp:PlaceHolder ID="contenedorHiddenFields" runat="server"></asp:PlaceHolder>
    </div>
   
   
    
    <%--ModalPopUps--%>
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
                            <asp:Button runat="server" ID="btnOk" CssClass="button-gradient green" Text="Aceptar" OnClick="AceptarPopUpResponder" />
                            <asp:Button runat="server" ID="btnCancel" CssClass="button-gradient blue" Text="Cancelar" OnClick="BtnCancelarPopUpResponder" />    
                        </div>
                        <div class="divClear"></div>
                
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

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
                            <asp:Button runat="server" ID="btnAceptarCancelacionPopUp" CssClass="button-gradient green" Text="Aceptar" OnClick="AceptarPopUpCancelacion" />
                            <asp:Button runat="server" ID="btnCancelConfirmacionPopUp" CssClass="button-gradient blue" Text="Cancelar"  />    
                        </div>
                        <div class="divClear"></div>
                
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>