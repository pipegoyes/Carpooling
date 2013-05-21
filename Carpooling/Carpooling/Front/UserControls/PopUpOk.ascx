<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopUpOk.ascx.cs" Inherits="Carpooling.Front.UserControls.PopUpOk" %>

<asp:Panel runat="server" ID="pnlMensajes1" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePopUpOk" PopupControlID="pnlMensajes1"
                                    TargetControlID="lblTemp" BackgroundCssClass="modalBackgroundMensajeModal" CancelControlID="btnOk">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblTemp"></asp:Label>
    <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="popUpContainer" class="popUpContainer">
                <div id="divEncabezado" class="divEncabezado">
                        <asp:Label runat="server" ID="lblTitulo"></asp:Label>
                </div>
                <div id="mainContentPopUp">
                    <asp:Label runat="server" ID="lblTextoMensaje"></asp:Label>
                    <div class="divBotonesPopUp">
                        <asp:Button runat="server" ID="btnOk" Text="Aceptar" OnClick="OnClickPadre" CssClass="button-gradient green"/>            
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>