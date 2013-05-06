<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="MisViajes.aspx.cs" Inherits="Carpooling.Front.Viajes.MisViajes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/MisViajes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Mis viajes.</h1>
            </hgroup>
            <p>
                <h2>Consulta aqui el listado completo de tus viajes.</h2>
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="titulo">Viajes vigentes</div>
    <div class="text">Son aquellos viajes que a la fecha no se han realizado. </div>
    <asp:DataList runat="server" ID="dataListViajesVigentes" 
                  ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="BtnVerSolicitudesClick" >
        <AlternatingItemStyle BackColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
        <HeaderTemplate>
            <div class="divCeldaMisViajesVigentes">
                <asp:Label ID="Label2" runat="server" Text="Fecha y hora"></asp:Label>    
            </div>
            <div class="divCeldaMisViajesVigentes">
                <asp:Label ID="Label4" runat="server" Text="Ciudad Origen"></asp:Label>    
            </div>
            <div class="divCeldaMisViajesVigentes">
                <asp:Label ID="Label5" runat="server" Text="Ciudad Destino"></asp:Label>    
            </div>
            <div class="clearfix"></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <div>
                <div class="divCeldaMisViajesVigentes">
                    <asp:Label ID="LinkButton1" runat="server" Text='<%# Eval("FechaHora") %>'/>    
                </div>
                <div class="divCeldaMisViajesVigentes">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ParadaOrigen") %>'></asp:Label>    
                </div>
                <div class="divCeldaMisViajesVigentes">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("ParadaDestino") %>'></asp:Label>    
                </div>
                <div>
                    <asp:LinkButton ID="btnVerSolicitud" runat="server" Text="Ver Solicitudes" CommandName="VerSolicitudes" CommandArgument='<%#Eval("IdViaje") %>' ></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:Panel ID="PanelSolicitudesDetalle" runat="server" Visible="False">
        <asp:DataList ID="dataListSolicitudes" runat="server" ForeColor="#333333" RepeatColumns="1"
                      ShowFooter="False" Width="100%">
            <AlternatingItemStyle BackColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                         ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
            <HeaderTemplate>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text="Solicitante"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text="Ciudad origen"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label  runat="server" Text="Ciudad destino"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label  runat="server" Text="Cupos solicitados"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label  runat="server" Text="Cupos disponibles"></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text="Comentario"></asp:Label>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text='<%# Eval("NombreSolicitante") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text='<%# Eval("CiudadOrigen") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text='<%# Eval("CiudadDestino") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label runat="server" Text='<%# Eval("CuposSolicitados") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("CuposDisponibles") %>'></asp:Label>
                </div>
                <div class="divCeldaSolicitudes">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Comentario") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>
</asp:Content>