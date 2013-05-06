<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Carpooling.Front.Error" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Opps, CarpoolingCo!!</h1>
            </hgroup>
            <p>
                <h2>Lo sentimos, la operación que intentaste realizar genero un error inesperado. Intentalo nuevamente.</h2>
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="detalleError">
        <h3>
            <asp:Label ID="lblTituloError" runat="server" Text="Titulo Error"></asp:Label>
        </h3>
        <asp:Label ID="lblDetalleError" runat="server" Text="Detalle Error"></asp:Label>
    </section>
</asp:Content>
