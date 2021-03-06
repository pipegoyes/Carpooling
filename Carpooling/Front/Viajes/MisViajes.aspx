﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="MisViajes.aspx.cs" Inherits="Carpooling.Front.Viajes.MisViajes" %>
<%--<%@ Register src="../UserControls/PopUpOk.ascx" tagName="PopUpConfirmation" tagPrefix="uc" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/MisViajes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/front-js/MisViajes.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">Viajes vigentes como conductor</div>
    <div class="text">Son aquellos viajes que he publicado pero a la fecha no se han realizado. </div>
    <asp:DataList runat="server" ID="dataListViajesVigentesConductor" 
                  ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="BtnVerDetalleClick" >
        <AlternatingItemStyle BackColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
        <HeaderTemplate>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label2" runat="server" Text="Fecha y hora"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label4" runat="server" Text="Ciudad Origen"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label5" runat="server" Text="Ciudad Destino"></asp:Label>    
            </div>
            <div class="clearfix"></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="LinkButton1" runat="server" Text='<%# Eval("FechaHora") %>'/>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ParadaOrigen") %>'></asp:Label>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("ParadaDestino") %>'></asp:Label>    
                </div>
                <div>
                    <asp:LinkButton ID="btnVerSolicitud" runat="server" Text="Ver Detalle" CommandName="VerDetalleConductor" CommandArgument='<%#Eval("IdViaje") %>' ></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:Label runat="server" ID="lblSinViajesVigentesConductor" Text="No hay viajes vigentes como conductor" Visible="False" CssClass="lblSinViajes"></asp:Label>
    
      <div class="titulo">Viajes vigentes como pasajero</div>
    <div class="text">Son aquellos viajes que a la fecha no se han realizado, pero tu solicitud ha sido aprobada para participar en el viaje. </div>
    <asp:DataList runat="server" ID="dataListViajesVigentesPasajero" 
                  ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="BtnVerDetalleClick" >
        <AlternatingItemStyle BackColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
        <HeaderTemplate>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label2" runat="server" Text="Fecha y hora"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label4" runat="server" Text="Ciudad Origen"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label5" runat="server" Text="Ciudad Destino"></asp:Label>    
            </div>
            <div class="clearfix"></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="LinkButton1" runat="server" Text='<%# Eval("FechaHora") %>'/>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ParadaOrigen") %>'></asp:Label>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("ParadaDestino") %>'></asp:Label>    
                </div>
                <div>
                    <asp:LinkButton ID="btnVerSolicitud" runat="server" Text="Ver Detalle" CommandName="VerDetallePasajero" CommandArgument='<%#Eval("IdViaje") %>' ></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:Label runat="server" ID="lblSinViajesVigentesPasajero" Text="No hay viajes vigentes como pasajero" Visible="False" CssClass="lblSinViajes"></asp:Label>

    
     <div class="titulo">Viajes realizados</div>
    <div class="text">Son aquellos viajes en los que ya has asistido, además en el detalle del viaje podriás calificar a tus compañeros de viaje si aun no lo has hecho. </div>
    <asp:DataList runat="server" ID="dataListViajesRealizados" 
                  ForeColor="#333333" RepeatColumns="1" ShowFooter="False" Width="100%" OnItemCommand="BtnVerDetalleClick" >
        <AlternatingItemStyle BackColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Small" 
                     ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
        <HeaderTemplate>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label2" runat="server" Text="Fecha y hora"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label4" runat="server" Text="Ciudad Origen"></asp:Label>    
            </div>
            <div class="divCeldaMisViajes">
                <asp:Label ID="Label5" runat="server" Text="Ciudad Destino"></asp:Label>    
            </div>
            <div class="clearfix"></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="LinkButton1" runat="server" Text='<%# Eval("FechaHora") %>'/>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ParadaOrigen") %>'></asp:Label>    
                </div>
                <div class="divCeldaMisViajes">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("ParadaDestino") %>'></asp:Label>    
                </div>
                <div>
                    <asp:LinkButton ID="btnVerSolicitud" runat="server" Text="Ver Detalle" CommandName="VerDetalleRealizado" CommandArgument='<%#Eval("IdViaje") %>' ></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:Label runat="server" ID="lblSinViajesRealizados" Text="No hay viajes realizados" Visible="False" CssClass="lblSinViajes"></asp:Label>
</asp:Content>