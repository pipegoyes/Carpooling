<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupCalificarParticipante.ascx.cs" Inherits="Carpooling.Front.UserControls.PopupCalificarParticipante" %>


<asp:Panel runat="server" ID="pnlCalificarParticipante"  Width="400" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeCalificarParticipante" PopupControlID="pnlCalificarParticipante" BehaviorID ="ModalBehaviour"
        TargetControlID="targetPop" PopupDragHandleControlID="divDrag" BackgroundCssClass="modalBackgroundMensajeModal">
    </ajaxToolkit:ModalPopupExtender>
    <div style="display: none;" runat="server" id="targetPop"></div>

    <asp:UpdatePanel ID="uplCalificarParticipante" runat="server" UpdateMode="Always">
    <ContentTemplate>

    <div class="popUpContainer">
        <div id="divDrag" class="divEncabezado" runat="server">
            <asp:Label runat="server" ID="lblTituloVentana" Text="Calificar"></asp:Label> 
        </div>

        <div class="mainContentPopUp">
            <asp:Panel ID="panelCalificarPasajero" runat="server" Visible="true" Style="padding: 10px; margin: 0 auto;">
                <table style="width: 80%; margin: 0 auto !important;">
                    <tr>
                        <td>Puntualidad:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgPuntualidadPasajero" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>

                        </td>
                    </tr>
                    <tr>
                        <td>Comportamiento:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgComportamientoPasajero" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>Veracidad de información:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgInformacionPasajero" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="panelCalificarConductor" runat="server" Visible="false" Style="padding: 10px; margin: 0 auto;">
                <table style="width: 80%; margin: 0 auto !important;">
                    <tr>
                        <td>Puntualidad:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgPuntualidadConductor" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                              StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                              style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>Comportamiento:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgComportamientoConductor" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                               StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>Veracidad de información:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgInformacionConductor" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>Vehículo:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgVehiculoConductor" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>Conducción:</td>
                        <td>
                            <ajaxToolkit:Rating runat="server" ID="rtgConduccionConductor" MaxRating="5" CurrentRating="0" CssClass="ratingStar"
                                StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"
                               style="height:14px !important; margin:0 !important;"></ajaxToolkit:Rating>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
           
            
            <div>
                <asp:Panel ID="panelError" class="ui-widget" runat="server" Visible="False" Width="100%">
                    <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                        <p>
                            <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                            <asp:Label ID="lblMensajeError" runat="server" Text="No hemos podido registrar su calificación, por favor intente de nuevo."></asp:Label>
                        </p>
                    </div>
                </asp:Panel>
                <asp:Panel class="ui-widget"  runat="server" ID="panelExitoso" Visible="False" Width="100%">
                    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                        <p>
                            <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                            <asp:Label ID="lblMensajeExitoso" runat="server" CssClass="divWithoutShadow" Text="Gracias por realizar la calificación."></asp:Label>
                        </p>
                    </div>
                </asp:Panel>
            </div>

            <asp:Panel ID="panelBotonesPrincipales" runat="server" class="divBotonesPopUp">
                <asp:Button runat="server" ID="btnAceptarPopUp" CssClass="button-gradient green" Text="Aceptar" OnClick="btnAceptarPopUp_Click" />
                <asp:Button runat="server" ID="btnCancelarPopUp" CssClass="button-gradient blue" Text="Cancelar" OnClientClick="HideModalPopup(); return false;" />    
            </asp:Panel>

            <asp:Panel ID="panelBotonesRespuesta" runat="server" class="divBotonesPopUp" Visible="false">
                <asp:Button runat="server" ID="btnContinuar" CssClass="button-gradient green" Text="Continuar" OnClick="btnContinuar_Click" />
            </asp:Panel>
            <div class="divClear"></div>
                
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>

 <%--   <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="uplDesactivarCuenta" runat="server">
        <ProgressTemplate>
            <asp:Label ID="Label1" runat="server" Text="Loading..." Style="top: 224px; left: 425px;
                position: absolute; height: 24px; width: 73px" BackColor="#00FF99"></asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>

</asp:Panel>

<script type="text/javascript">
    function HideModalPopup() {
        $find("ModalBehaviour").hide();
    }
</script>