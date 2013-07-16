<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesactivarCuenta.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.DesactivarCuenta" %>

<asp:Panel runat="server" ID="pnlDesactivarCuenta" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeDesactivarCuenta" PopupControlID="pnlDesactivarCuenta" BehaviorID ="ModalBehaviour"
        TargetControlID="targetPop" BackgroundCssClass="modalBackgroundMensajeModal">
    </ajaxToolkit:ModalPopupExtender> <%--CancelControlID="btnCancelConfirmacionPopUp"--%>
    <div style="display: none;" runat="server" id="targetPop"></div>

    <asp:UpdatePanel ID="uplDesactivarCuenta" runat="server">
    <ContentTemplate>
    <div class="popUpContainer">
        <div class="divEncabezado">
            <asp:Label runat="server" ID="lblTituloVentana" Text="Desactivar Cuenta"></asp:Label> 
        </div>
        <div class="mainContentPopUp">
            <asp:Panel ID="panelMensaje" runat="server">
                <asp:Label runat="server" ID="lblPregunta" Text="¿Estas seguro que deseas desactivar la cuenta?"></asp:Label>
            </asp:Panel>
            <div>
                <asp:Panel ID="panelError" class="ui-widget" runat="server" Visible="False" Width="450px">
                    <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                        <p>
                            <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                            <asp:Label ID="lblMensajeError" runat="server" Text="Su cuenta no ha podido ser desactivada, por favor intente de nuevo."></asp:Label>
                        </p>
                    </div>
                </asp:Panel>
                <asp:Panel class="ui-widget"  runat="server" ID="panelExitoso" Visible="False" Width="450px">
                    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                        <p>
                            <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                            <asp:Label ID="lblMensajeExitoso" runat="server" CssClass="divWithoutShadow" Text="Su cuenta ha sido desactivada."></asp:Label>
                        </p>
                    </div>
                </asp:Panel>
            </div>

            <asp:Panel ID="panelBotonesPrincipales" runat="server" class="divBotonesPopUp">
                <asp:Button runat="server" ID="btnAceptarCancelacionPopUp" CssClass="button-gradient green" Text="Aceptar" OnClick="btnAceptarCancelacionPopUp_Click" />
                <asp:Button runat="server" ID="btnCancelConfirmacionPopUp" CssClass="button-gradient blue" Text="Cancelar" OnClientClick="HideModalPopup(); return false;" />    
            </asp:Panel>

            <asp:Panel ID="panelBotonesRespuesta" runat="server" class="divBotonesPopUp" Visible="false">
                <asp:Button runat="server" ID="btnContinuar" CssClass="button-gradient green" Text="Continuar" OnClick="btnContinuar_Click" />
            </asp:Panel>
            <div class="divClear"></div>
                
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="uplDesactivarCuenta" runat="server">
        <ProgressTemplate>
            <asp:Label ID="Label1" runat="server" Text="Loading..." Style="top: 224px; left: 425px;
                position: absolute; height: 24px; width: 73px" BackColor="#00FF99"></asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Panel>

<script type="text/javascript">
    function HideModalPopup() {
        $find("ModalBehaviour").hide();
    }
</script>