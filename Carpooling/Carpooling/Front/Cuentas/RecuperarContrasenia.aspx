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
    <section id="FormRecuperarContrasenia">
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
    </section>

    <section id="botones" class="divBotonesPopUp">
        <asp:Button ID="btnRecuperar" ClientID="btnRecuperar" runat="server" Text="Recuperar contraseña" OnClick="btnRecuperar_Click"
            CausesValidation="true" ValidationGroup="ValidacionCampos" CssClass="button-gradient green" style="display:inline-block; width:150px;"/>
    </section>
</asp:Content>
