<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Carpooling.Front.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC-_VdOgJeuq0exLR38Un_LoM5DilB_1_0&sensor=false"></script>
    <script type="text/javascript" src="./Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="./Scripts/Inicio.js"></script>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >
    <asp:Image runat="server" ID="bannerInicio" ImageUrl="../Styles/images/Inicio.png"/>

</asp:Content>
