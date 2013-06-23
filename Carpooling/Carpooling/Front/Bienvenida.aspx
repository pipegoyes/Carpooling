<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="Bienvenida.aspx.cs" Inherits="Carpooling.Front.Bienvenida" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Image runat="server" ImageUrl="../Styles/images/Bienvenida.png" ID="imgBackgroud" CssClass="roundBorders"/>    
    <a id="linkRegistrarse" href="Cuentas/RegistroUsuario.aspx">Registrate</a>
</asp:Content>
