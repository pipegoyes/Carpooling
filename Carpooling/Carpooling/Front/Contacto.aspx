<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Carpooling.Front.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/RegistroUsuario.css" rel="stylesheet">
    <link href="/Styles/front-css/PublicarViaje.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/General.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlFormulario" runat="server">
        <section id="FormContactenos">
            <div class="titulo">Contactenos</div>
            <div class="text">Puede enviarnos un mensaje usando el siguiente formulario.</div>

            <div class="campoCrearCuenta" style="margin-top: 30px !important;">
                <div class="labelInformacionBasica leftPosition ">Su nombre:</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbNombreContacto" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="txbNombreContacto_Validation1" runat="server" ControlToValidate="txbNombreContacto" ErrorMessage="Su nombre es requerido" Display="None" ValidationGroup="ValidacionCampos"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC1" runat="server" TargetControlID="txbNombreContacto_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                <div class="divClear"></div>
            </div>

            <div class="campoCrearCuenta" style="margin-top: 15px !important;">
                <div class="labelInformacionBasica leftPosition ">Correo electronico:</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbCorreoElectronico" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="txbCorreoElectronico_RV" runat="server" ControlToValidate="txbCorreoElectronico" ErrorMessage="El correo electronico es requerido" Display="None" ValidationGroup="ValidacionCampos"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="txbCorreoElectronico_VC" runat="server" TargetControlID="txbCorreoElectronico_RV" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="txtCorreoElectronico_REGV" runat="server" ControlToValidate="txbCorreoElectronico" ErrorMessage="El formato del correo electronico no es valido" ValidationExpression="^[a-z][\w\.]+@([\w\-]+\.)+[a-z]{2,7}$" Display="None" ValidationGroup="ValidacionCampos"></asp:RegularExpressionValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="txtCorreoElectronico_VC2" runat="server" TargetControlID="txtCorreoElectronico_REGV" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
                <div class="divClear"></div>
            </div>

            <div class="campoCrearCuenta" style="margin-top: 15px !important;">
                <div class="labelInformacionBasica leftPosition ">Asunto:</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbAsunto" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="txbAsunto_RV" runat="server" ControlToValidate="txbAsunto" ErrorMessage="El asunto es requerido" Display="None" ValidationGroup="ValidacionCampos"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="txbAsunto_VC" runat="server" TargetControlID="txbAsunto_RV" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                <div class="divClear"></div>
            </div>

            <div class="campoCrearCuenta" style="margin-top: 15px !important;">
                <div class="labelInformacionBasica leftPosition ">Mensaje:</div>
                <div class="txbInformacionBasica leftPosition">
                    <asp:TextBox ID="txbMensaje" runat="server" TextMode="MultiLine" Height="150px" Rows="10" Width="350px" style="border: 1px solid #C0C0C0 !important;"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="txbMensaje_RV" runat="server" ControlToValidate="txbMensaje" ErrorMessage="El mensaje es requerido" Display="None" ValidationGroup="ValidacionCampos"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="txbMensaje_VC" runat="server" TargetControlID="txbMensaje_RV" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
                <div class="divClear"></div>
            </div>
        </section>

        <section id="botones" class="divBotonesPopUp">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click"
                CausesValidation="true" ValidationGroup="ValidacionCampos" CssClass="button-gradient green" style="display:inline-block; width:120px;"/>
        </section>
    </asp:Panel>

    <asp:Panel ID="pnlConfirmacion" runat="server" Visible="false">
        <div class="titulo">Contactenos</div>
        <div class="text">Gracias por dejarnos conocer su opinión.</div>

        <section id="botones2" class="divBotonesPopUp">
            <asp:Button ID="btnRegresar" runat="server" Text="Regresar" OnClick="btnRegresar_Click"
                CssClass="button-gradient blue" style="display:inline-block; width:120px;"/>
        </section>
    </asp:Panel>
</asp:Content>
