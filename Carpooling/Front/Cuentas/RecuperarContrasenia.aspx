<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarContrasenia.aspx.cs" Inherits="Carpooling.Front.Cuentas.RecuperarContrasenia" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/RegistroUsuario.css" rel="stylesheet">
    <link href="/Styles/front-css/PublicarViaje.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/General.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="FormularioDatos" class="ui-widget" runat="server" Width="98%">
            <asp:Panel ID="Titulopnl" runat="server" CssClass="titulo">
                <asp:Label ID="Titulo" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="textoMensaje" runat="server" CssClass="text">
                <asp:Label ID="Mensaje" runat="server"></asp:Label>
            </asp:Panel>    

        <div class="campoCrearCuenta" style="margin-top: 30px !important;">
            <div class="labelInformacionBasica leftPosition ">Email ó Nombre de Usuario</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txbIdEmailUsuario" ClientID="txbIdEmailUsuario" runat="server"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtNombreUsuario_Validation1" runat="server" ControlToValidate="txbIdEmailUsuario" ErrorMessage="El nombre de usuario o email es requerido" Display="None" ValidationGroup="ValidacionCampos"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC1" runat="server" TargetControlID="txtNombreUsuario_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>                
    </asp:Panel>
    <section id="botones" class="divBotonesPopUp">
        <asp:Button ID="btnRecuperar" ClientID="btnRecuperar" runat="server" Text="Recuperar contraseña" OnClick="btnRecuperar_Click"
            CausesValidation="true" ValidationGroup="ValidacionCampos" CssClass="button-gradient green" Style="display: inline-block; width: 150px;" />
    </section>

    <div style="width:50%; margin:0 auto !important;">
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

</asp:Content>
