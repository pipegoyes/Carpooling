<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PerfilPublico.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.PerfilPublico" %>

<asp:UpdatePanel ID="uplVentanaModal" runat="server" UpdateMode="Conditional">
<ContentTemplate>

<asp:Panel runat="server" ID="pnlPerfilPublico" style="width:750px; height:600px; display: none;" CssClass="modalArea">  <%----%>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePerfilPublico" PopupControlID="pnlPerfilPublico"
        TargetControlID="lblMensajesPop" BackgroundCssClass="modalBackground" CancelControlID="btnCerrar"
        Drag="True" PopupDragHandleControlID="btnMover" RepositionMode="RepositionOnWindowResize">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label runat="server" ID="lblMensajesPop"></asp:Label>

    <div id="areaPopup" class="areaPopup">
        <section id="areaTitulo" class="areaTitulo">
            <div id="mover">
                <img runat="server" id="btnMover" src="~/Styles/images/close-icon.png" class="botonModal mover" alt=""/>
            </div>
            <div id="botones">
                <img runat="server" id="btnCerrar" src="~/Styles/images/close-icon.png" class="botonModal cerrar" alt=""/>
            </div>
            <div id="titutlo">
                <asp:Label ID="lblTituloModal" runat="server" Text="Nombre Usuario"></asp:Label>
            </div>
            <div style="clear:both;"></div>
        </section>

        <section id="areaFormulario" class="areaFormulario">
            <div id="datosFormulario">

                <section id="datosPesonales" class="seccionDatosPersonales">
                    <fieldset>
                        <legend>Nombres:</legend>
                        <asp:Label ID="lblNombresApellidos" runat="server" Text="No disponible"></asp:Label>
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

                <section id="datosCuenta" class="seccionDatos">
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

                <section id="datosAdicionales" class="seccionDatos">
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

            </div>
            <div id="botonesFormulario">
                
            </div>
        </section>
    </div>
</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>
