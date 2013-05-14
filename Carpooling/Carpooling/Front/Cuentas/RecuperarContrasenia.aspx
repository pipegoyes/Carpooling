<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarContrasenia.aspx.cs" Inherits="Carpooling.Front.Cuentas.RecuperarContrasenia" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Recupera tu cuenta en CarpoolingCo</h1>
            </hgroup>
            <p>
                <h2>Informanos el email con el que te registrarte o tu nombre de usuario y te enviaremos una nueva contraseña para que continues usuando los servicios de CarpoolingCo</h2>
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="FormRecuperarContrasenia">
        <fieldset>
            <legend>Email ó nombre de usuario</legend>
            <asp:TextBox ID="txbIdEmailUsuario" ClientID="txbIdEmailUsuario" runat="server"></asp:TextBox>
        </fieldset>        
    </section>

    <section id="botones">
        <asp:Button ID="btnRecuperar" ClientID="btnRecuperar" runat="server" Text="Recuperar contrasenia" OnClick="btnRecuperar_Click"/>
    </section>
</asp:Content>
