<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Carpooling.Front.Cuentas.MiPerfil" %>
<%@ Register Src="~/Front/Cuentas/wuc/CambioContrasenia.ascx" TagName="CambioContrasenia" TagPrefix="uc" %>
<%@ Register Src="~/Front/Cuentas/wuc/DesactivarCuenta.ascx" TagName="DesactivarCuenta" TagPrefix="uc" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Tu perfil en CarpoolingCo</h1>
            </hgroup>
            <p>
                <h2>Revisa y ajusta tu perfil y compartelo con la comunidad de CarpoolingCo</h2>
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="tituloPerfil">
        <asp:Label ID="lblNombresApellidos" runat="server" Text="No disponible"></asp:Label>
    </section>

    <section id="datosPesonales">
        <fieldset>
            <legend>Nombres:</legend>
            <asp:Label ID="lblNombres" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Apellidos:</legend>
            <asp:Label ID="lblApellidos" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Ciudad de residencia:</legend>
            <asp:Label ID="lblResidencia" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Género</legend>
            <asp:Label ID="lblGenero" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Fecha de nacimiento:</legend>
            <asp:Label ID="lblFechaNacimiento" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Ocupación:</legend>
            <asp:Label ID="lblOcupacion" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Teléfono movil:</legend>
            <asp:Label ID="lblTelefonoMovil" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Teléfono fijo:</legend>
            <asp:Label ID="lblTelefonoFijo" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Caracteristicas:</legend>
            <asp:Image ID="imgFumador" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/nofumador.png"/>
            <asp:Image ID="imgVehiculo" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/novehiculo.png"/>
        </fieldset>
    </section>

    <section id="datosCuenta">
        <fieldset>
            <legend>Id Usuario:</legend>
            <asp:Label ID="lblIdUsuario" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Email:</legend>
            <asp:Label ID="lblEmail" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <legend>Reputación:</legend>
            <asp:DropDownList ID="ddlReputación" runat="server">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblReputación" runat="server" Text="No disponible"></asp:Label>
        </fieldset>
        <fieldset>
            <legend>Ultimo ingreso:</legend>
            <asp:Label ID="lblFechaUltimoIngreso" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
    </section>

    <section id="datosAdicionales">
        <fieldset>
            <legend>Imagen de la cuenta:</legend>
            <figure>
                <asp:Image ID="imgImagenCuenta" runat="server" Height="160" Width="160"/>
            </figure>
        </fieldset>
        <fieldset>
            <legend>Información adicional:</legend>
            <asp:Label ID="lblInfoAdicional" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
    </section>

    <section id="botones">
        <asp:Button ID="btnEditarPerfil" ClientID="btnEditarPerfil" runat="server" Text="Editar perfil" style="float:left;" OnClick="btnEditarPerfil_Click"/>
        <asp:UpdatePanel ID="upnMiPerfil" runat="server" >
            <ContentTemplate>
                <asp:Button ID="btnCambiarContrasenia" ClientID="btnCambiarContrasenia" runat="server" Text="Cambiar contraseña" style="float:left;" OnClick="btnCambiarContrasenia_Click"/>
                <asp:Button ID="btnDesactivarCuenta" ClientID="btnDesactivarCuenta" runat="server" Text="Desactivar cuenta" style="float:left;" OnClick="btnDesactivarCuenta_Click"/>
                <asp:Button ID="Button1" runat="server" Text="estaado viajes" style="float:left;" OnClick="Button1_Click"/>
            </ContentTemplate>
        </asp:UpdatePanel>

    </section>

    <uc:CambioContrasenia ID="ucCambioContrasenia" runat="server"/>
    <uc:DesactivarCuenta ID="ucDesactivarCuenta" runat="server"/>
</asp:Content>