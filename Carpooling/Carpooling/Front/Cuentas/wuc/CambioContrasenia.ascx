<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CambioContrasenia.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.CambioContrasenia" %>



<asp:Panel runat="server" ID="pnlCambioContrasenia" Width="400" Style="display: none;">  <%----%>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeCambioContrasenia" PopupControlID="pnlCambioContrasenia" BehaviorID ="ModalBehaviourCambioContrasenia"
        TargetControlID="targetPop"  PopupDragHandleControlID="divDrag" BackgroundCssClass="modalBackgroundMensajeModal"> <%--CancelControlID="btnCerrar"--%>
    </ajaxToolkit:ModalPopupExtender>
    <div style="display: none;" runat="server" id="targetPop"></div>

    <asp:UpdatePanel ID="uplVentanaModal" runat="server" UpdateMode="Always">
        <ContentTemplate>
    
            <div class="popUpContainer">
                <div id="divDrag" class="divEncabezado" runat="server">
                    <asp:Label runat="server" ID="lblTituloVentana" Text="Cambiar contraseña"></asp:Label> 
                </div>

                <div class="mainContentPopUp">
                    <asp:Panel ID="datosFormulario" runat="server" Width="75%" style="margin: 0 auto !important;">
                        <fieldset style="margin-bottom:5px;">
                            <legend>Contraseña actual:</legend>
                            <asp:TextBox ID="txbContraseniaActual" runat="server" Text="No disponible" TextMode="Password" CausesValidation="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txbContraseniaActual_Validator1" runat="server" ControlToValidate="txbContraseniaActual" ErrorMessage="La constraseña actual es requerida" Display="None" ValidationGroup="ValidacionActualizarPass"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="txbContraseniaActual_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                            <%--<asp:RegularExpressionValidator ID="txtContrasena_Validation2" runat="server" ControlToValidate="txbContraseniaActual" ErrorMessage="El formato de la contraseña no es valido" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$" Display="None" ValidationGroup="ValidacionActualizarPass"></asp:RegularExpressionValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC2" runat="server" TargetControlID="txtContrasena_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>--%>
                        </fieldset>
                        <fieldset style="margin-bottom:5px;">
                            <legend>Nueva contraseña:</legend>
                            <asp:TextBox ID="txbNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password" CausesValidation="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtContrasena_Validation1" runat="server" ControlToValidate="txbNuevaContrasenia" ErrorMessage="La nueva constraseña es requerida" Display="None" ValidationGroup="ValidacionActualizarPass"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC1" runat="server" TargetControlID="txtContrasena_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbNuevaContrasenia" ErrorMessage="El formato de la contraseña no es valido" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$" Display="None" ValidationGroup="ValidacionActualizarPass"></asp:RegularExpressionValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator1" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                        </fieldset>
                        <fieldset>
                            <legend>Confirmación nueva contraseña:</legend>
                            <asp:TextBox ID="txbReNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password" CausesValidation="true"></asp:TextBox>
                            <asp:CompareValidator ID="txtReContrasena_Validator3" runat="server" ControlToValidate="txbReNuevaContrasenia" ControlToCompare="txbNuevaContrasenia"  ErrorMessage="La confirmación de la contraseña no coincide" Display="None" ValidationGroup="ValidacionActualizarPass"></asp:CompareValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC3" runat="server" TargetControlID="txtReContrasena_Validator3" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                        </fieldset>
                    </asp:Panel>

                    <div>
                        <asp:Panel ID="panelError" class="ui-widget" runat="server" Visible="False" Width="98%">
                            <div class="ui-state-error ui-corner-all" style="margin: 20px auto 0 auto; padding: 0 8px;">
                                <p>
                                    <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                    <asp:Label ID="lblMensajeError" runat="server" Text="Su contraseña no pudo ser cambiada, por favor intente de nuevo."></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                        <asp:Panel class="ui-widget"  runat="server" ID="panelExitoso" Visible="False" Width="98%">
                            <div class="ui-state-highlight ui-corner-all" style="margin: 20px auto 0 auto; padding: 0 8px;">
                                <p>
                                    <span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
                                    <asp:Label ID="lblMensajeExitoso" runat="server" CssClass="divWithoutShadow" Text="Su contraseña ha sido cambiada."></asp:Label>
                                </p>
                            </div>
                        </asp:Panel>
                    </div>

                    <asp:Panel ID="panelBotonesPrincipales" runat="server" class="divBotonesPopUp">
                        <asp:Button runat="server" ID="btnGuardarContrasenia" CausesValidation="true" ValidationGroup="ValidacionActualizarPass" CssClass="button-gradient green" Text="Aceptar" OnClick="btnGuardarContrasenia_Click" />
                        <asp:Button runat="server" ID="btnCancelConfirmacionPopUp" CssClass="button-gradient blue" Text="Cancelar" OnClientClick="HideModalPopupCambioContrasenia(); return false;" />    
                    </asp:Panel>

                    <asp:Panel ID="panelBotonesRespuesta" runat="server" class="divBotonesPopUp" Visible="false">
                        <asp:Button runat="server" ID="btnContinuar" CssClass="button-gradient green" Text="Continuar" OnClick="btnContinuar_Click" />
                    </asp:Panel>
                    <div class="divClear"></div>
               </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>

<script type="text/javascript">
    function HideModalPopupCambioContrasenia() {
        $find("ModalBehaviourCambioContrasenia").hide();
    }
</script>


