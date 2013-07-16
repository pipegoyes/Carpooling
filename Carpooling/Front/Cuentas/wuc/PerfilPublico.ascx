<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PerfilPublico.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.PerfilPublico" %>


<asp:Panel runat="server" ID="pnlPerfilPublico" Width="450" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePerfilPublico" PopupControlID="pnlPerfilPublico" BehaviorID ="ModalBehaviour"
        TargetControlID="targetPop" PopupDragHandleControlID="divDrag" BackgroundCssClass="modalBackgroundMensajeModal">
    </ajaxToolkit:ModalPopupExtender>
    <div style="display: none;" runat="server" id="targetPop"></div>

    <asp:UpdatePanel ID="uplVentanaModal" runat="server" UpdateMode="Conditional">
    <ContentTemplate>

    <div class="popUpContainer">
        <div id="divDrag" class="divEncabezado" runat="server">
            <asp:Label runat="server" ID="lblTituloVentana" Text="Nombre Usuario"></asp:Label> 
        </div>

        <div class="mainContentPopUp">

            <div id="datosFormulario">

 

                <section id="datosAdicionales" style="float: left; width:50%;">
                    <fieldset>
                        <legend>Imagen de la cuenta:</legend>
                        <figure id="fotoUsuario">
                            <asp:Image ID="imgImagenCuenta" runat="server" Height="160" Width="160"/>
                        </figure>
                    </fieldset>
                    <fieldset>
                        <legend>Información adicional:</legend>
                        <asp:Label ID="lblInfoAdicional" runat="server" Text="No disponible" Width="100%"></asp:Label>               
                    </fieldset>
                </section>

                <section id="datosCuenta" style="float: left; width:50%;">
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



                <section id="datosPesonales" style="float: right; width:100%;">
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


            </div> 
            
            <div class="divClear"></div>

            <div id="panelBotonesRespuesta" class="divBotonesPopUp">
                <asp:Button runat="server" ID="btnCancelarPopUp" CssClass="button-gradient blue" Text="Cerrar" OnClientClick="HideModalPopup(); return false;" />     
            </div>            

            
                
        </div>
    </div>

    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Panel>

<script type="text/javascript">
    function HideModalPopup() {
        $find("ModalBehaviour").hide();
    }
</script>




