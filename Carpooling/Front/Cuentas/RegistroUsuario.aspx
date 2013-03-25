<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="Carpooling.Front.Cuentas.RegistroUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upnlInformacionUsuario" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <ajaxToolkit:Accordion ID="acnInformacionUsuario" runat="server" SelectedIndex="0" AutoSize="None" FadeTransitions="true" TransitionDuration="250"
                FramesPerSecond="40" RequireOpenedPane="true" SuppressHeaderPostbacks="true">
                <Panes>
                    <ajaxToolkit:AccordionPane ID="pnlPaso1" runat="server">
                        <Header>
                            <span>1. Informacion básica</span>
                        </Header>
                        <Content>
                            <table>
                                <tr>
                                    <td>Nombre de usuario:</td>
                                    <td>
                                        <asp:TextBox ID="txbNombreUsario" runat="server">
                                        </asp:TextBox>
                                    </td>
                                </tr>

                            </table>
                        </Content>

                    </ajaxToolkit:AccordionPane>
                    <ajaxToolkit:AccordionPane ID="pnlPaso2" runat="server">
                        <Header>
                            <span>2. Informacion básica</span>
                        </Header>
                        <Content>
                            <table>
                                <tr>

                                </tr>

                            </table>
                        </Content>

                    </ajaxToolkit:AccordionPane>
                </Panes>                
            </ajaxToolkit:Accordion>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
