<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopUpConfrimarCupos.ascx.cs" Inherits="Carpooling.Front.UserControls.PopUpConfrimarCupos" %>
<%--
<asp:Panel runat="server" ID="pnlMensajes" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeMensajes" PopupControlID="pnlMensajes"
                                    TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackgroundMensajeModal" 
                                    CancelControlID="btnCancel">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>
    <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="popUpContainer" class="popUpContainer">
                <div id="divEncabezado" class="divEncabezado">
                        <asp:Label runat="server" ID="lblTitulo"></asp:Label>
                </div>
                <div id="mainContentPopUp" class="mainContentPopUp">
                    <div>
                        <asp:Label runat="server" ID="lblTextoMensaje"></asp:Label>
                        <asp:TextBox ID="txbCuposSolicitados" runat="server" CssClass="txbCuposSolicitados"></asp:TextBox>
                    </div>
            
                    <div>
                        <asp:Label runat="server" Text="Comentario"></asp:Label>
                        <asp:TextBox ID="txbComentario" runat="server" TextMode="MultiLine" Rows="3" ></asp:TextBox>
                    </div>
                    <%--Divs de respuesta de la transaccion
                    <asp:Panel ID="panelExitoso" class="ui-widget" runat="server" Visible="False">
                        <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                            <p>
                                <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                <strong>Alert:</strong>
                                <asp:Label runat="server" Text="Mensaje de error"></asp:Label>
                            </p>
                        </div>
                    </asp:Panel>
                    <div class="ui-widget" >
                        <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                            <p>
                                <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                                <strong class="divWithoutShadow">Hey!</strong>
                                <asp:Label runat="server" CssClass="divWithoutShadow" Text="Mensaje exitoso"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="divBotonesPopUp">
                        <asp:Button runat="server" ID="btnOk" Text="Aceptar" CssClass="button-gradient green" OnClick="ClickPadre"/>
                        <asp:Button runat="server" ID="btnCancel" Text="Cancelar" CssClass="button-gradient blue" />    
                    </div>
                    <div class="divClear"></div>
                
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>--%>