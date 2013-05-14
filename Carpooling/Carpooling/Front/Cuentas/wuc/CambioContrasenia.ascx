<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CambioContrasenia.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.CambioContrasenia" %>

<asp:UpdatePanel ID="uplVentanaModal" runat="server" UpdateMode="Conditional">
<ContentTemplate>

<asp:Panel runat="server" ID="pnlCambioContrasenia" style="width:400px; height:300px; display: none;" CssClass="modalArea">  <%----%>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeCambioContrasenia" PopupControlID="pnlCambioContrasenia"
        TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackground" CancelControlID="btnCerrar"
        Drag="True" PopupDragHandleControlID="btnMover" RepositionMode="RepositionOnWindowResize">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>

    <div id="areaPopup" class="areaPopup">
        <section id="areaTitulo" class="areaTitulo">
            <div id="mover">
                <img runat="server" id="btnMover" src="~/Styles/images/close-icon.png" class="botonModal mover" alt=""/>
            </div>
            <div id="botones">
                <img runat="server" id="btnCerrar" src="~/Styles/images/close-icon.png" class="botonModal cerrar" alt=""/>
            </div>
            <div id="titutlo">
                <asp:Label ID="tituloModal" runat="server" Text="Cambiar contraseña"></asp:Label>
            </div>
            <div style="clear:both;"></div>
        </section>

        <section id="areaFormulario" class="areaFormulario">
            <div id="datosFormulario">
                <fieldset>
                    <legend>Contraseña actual:</legend>
                    <asp:TextBox ID="txbContraseniaActual" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
                </fieldset>
                <fieldset>
                    <legend>Nueva contraseña:</legend>
                    <asp:TextBox ID="txbNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
                </fieldset>
                <fieldset>
                    <legend>Confirmación nueva contraseña:</legend>
                    <asp:TextBox ID="txbReNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
                </fieldset>
            </div>
            <div id="botonesFormulario">
                <asp:Button ID="btnGuardarContrasenia" runat="server" Text="Cambiar" OnClick="btnGuardarContrasenia_Click" />
            </div>
        </section>
    </div>
</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>
