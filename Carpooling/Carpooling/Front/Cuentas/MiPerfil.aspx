<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Carpooling.Front.Cuentas.MiPerfil" %>
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
            <span>
                Nombres:
            </span>
            <asp:Label ID="lblNombres" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Apellidos:
            </span>
            <asp:Label ID="lblApellidos" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Ciudad de residencia:
            </span>
            <asp:Label ID="lblResidencia" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Genero:
            </span>
            <asp:Label ID="lblGenero" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Fecha de nacimiento:
            </span>
            <asp:Label ID="lblFechaNacimiento" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Ocupación:
            </span>
            <asp:Label ID="lblOcupacion" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Teléfono movil:
            </span>
            <asp:Label ID="lblTelefonoMovil" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Teléfono fijo:
            </span>
            <asp:Label ID="lblTelefonoFijo" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <asp:Image ID="imgFumador" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/orderedList0.png"/>
            <asp:Image ID="imgVehiculo" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/orderedList0.png"/>
        </fieldset>
    </section>

    <section id="datosCuenta">
        <fieldset>
            <span>
                Id Usuario:
            </span>
            <asp:Label ID="lblIdUsuario" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Email:
            </span>
            <asp:Label ID="lblEmail" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
        <fieldset>
            <span>
                Reputación:
            </span>
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
            <span>
                Ultimo ingreso:
            </span>
            <asp:Label ID="lblFechaUltimoIngreso" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
    </section>

    <section id="datosAdicionales">
        <fieldset>
            <span>
                Imagen de la cuenta:
            </span>
            <figure>
                <asp:Image ID="imgImagenCuenta" runat="server" Height="160" Width="160" ImageUrl="~/Styles/images/imgFotoPerfilHombre.jpg"/>
            </figure>
        </fieldset>
        <fieldset>
            <span>
                Información adicional:
            </span>
            <asp:Label ID="lblInfoAdicional" runat="server" Text="No disponible"></asp:Label>               
        </fieldset>
    </section>

    <section id="botones">
        <asp:Button ID="btnEditarPerfil" ClientID="btnEditarPerfil" runat="server" Text="Editar perfil" style="float:left;" OnClick="btnEditarPerfil_Click"/>
        <input id="btnCambiarContrasenia" type="button" value="Cambiar contraseña" style="float:left;"/>
    </section>
</asp:Content>
