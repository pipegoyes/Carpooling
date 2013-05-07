<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopUpConfrimarCupos.ascx.cs" Inherits="Carpooling.Front.UserControls.PopUpConfrimarCupos" %>

<asp:Panel runat="server" ID="pnlMensajes" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeMensajes" PopupControlID="pnlMensajes"
                                    TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackgroundMensajeModal" CancelControlID="btnCancel">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>
    <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="popUpContainer" class="popUpContainer">
                <div id="divEncabezado">
                    
                    <div id="tituloPopUp">
                        <asp:Label runat="server" ID="lblTitulo"></asp:Label>    
                    </div>
                    <asp:ImageButton ID="btnClosePopUp2"  ImageUrl="~/Styles/images/close-icon.png" ClientIDMode="Static" runat="server"/>
                    <div class="divClear"></div>
                </div>
                <div id="mainContentPopUp">
                    <div>
                        <asp:Label runat="server" ID="lblTextoMensaje"></asp:Label>
                        <asp:TextBox ID="txbCuposSolicitados" runat="server"></asp:TextBox>
                    </div>
            
                    <div>
                        <asp:Label runat="server" Text="Comentario"></asp:Label>
                        <asp:TextBox ID="txbComentario" runat="server" ></asp:TextBox>
                    </div>
                    <div class="divBotonPopUp">
                        <asp:Button runat="server" ID="btnOk" Text="Aceptar" OnClick="ClickPadre"/>        
                    </div>
                    <div class="divBotonPopUp">
                        <asp:Button runat="server" ID="btnCancel" Text="Cancelar" />    
                    </div>
                    <div class="divClear"></div>
                
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>