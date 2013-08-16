<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PerfilPublico.ascx.cs" Inherits="Carpooling.Front.Cuentas.wuc.PerfilPublico" %>


<asp:Panel runat="server" ID="pnlPerfilPublico" Width="450" Style="display: none;">
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePerfilPublico" PopupControlID="pnlPerfilPublico" BehaviorID ="ModalBehaviour"
        TargetControlID="targetPop" PopupDragHandleControlID="divDrag" BackgroundCssClass="modalBackgroundMensajeModal">
    </ajaxToolkit:ModalPopupExtender>
    <div style="display: none;" runat="server" id="targetPop"></div>

    <asp:UpdatePanel ID="uplVentanaModal" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>

        <div class="popUpContainer">
            <div id="divDrag" class="divEncabezado" runat="server">
                <asp:Label runat="server" ID="lblTituloVentana" Text="Nombre Usuario"></asp:Label> 
            </div>

            <div class="mainContentPopUp">
            
                <div id="datosFormulario">
                    <section id="datosAdicionales" style="float: left; width:50%;">
                    
                        <div style="width:100%; float:left;">
                            <div style="width:100%; text-align:center; font-weight:bold;">
                                <span style="font-size:10px; margin-right:3px;">Id Usuario:</span>
                                <asp:Label ID="lblIdUsuario" runat="server" Text="No disponible"></asp:Label>
                            </div>            
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <figure id="fotoUsuario" style="width:160px; margin: 0 auto;">
                                <asp:Image ID="imgImagenCuenta" runat="server" Height="160" Width="160"
                                    style="border-radius: 5px; border: solid thin #888888; margin: 0 auto; display:block;"/>
                            </figure>

                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:center; font-weight:bold; font-size:10px;"> 
                                Ultimo ingreso:                                        
                            </div>
                            <div style="width:100%; text-align:center;">
                                <asp:Label ID="lblFechaUltimoIngreso" runat="server" Text="No disponible"></asp:Label>
                            </div>
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:center; font-weight:bold; font-size:10px;"> 
                                Reputación:
                            </div>
                            <div style="width:100%; text-align:center; vertical-align:middle;">
                                <ajaxToolkit:Rating runat="server" ID="rtgReputación" MaxRating="5" CurrentRating="0" CssClass="ratingStar" ReadOnly="true"
                                    StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty" 
                                    style="height:14px !important; margin:0 !important; margin-top:2px !important; width:70px; display:inline-block;"></ajaxToolkit:Rating>
                                <asp:Label ID="lblReputación" runat="server" Text="No disponible" style="margin-left:5px; vertical-align:top;"></asp:Label>
                            </div>
                        </div>
                    </section>

                    <section id="datosCuenta" style="float: left; width:50%;">
                        <div style="width:100%; float:left;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Nombres:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblNombresApellidos" runat="server" Text="No disponible"></asp:Label>
                            </div>
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Email:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblEmail" runat="server" Text="No disponible"></asp:Label>               
                            </div>
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Ciudad de residencia:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblResidencia" runat="server" Text="No disponible"></asp:Label>               
                            </div>
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Género:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblGenero" runat="server" Text="No disponible"></asp:Label>
                            </div>          
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Fecha de nacimiento:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblFechaNacimiento" runat="server" Text="No disponible"></asp:Label>               
                            </div>
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Ocupación:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Label ID="lblOcupacion" runat="server" Text="No disponible"></asp:Label>    
                            </div>          
                        </div>

                        <div style="width:100%; float:left; margin-top:5px;">
                            <div style="width:100%; text-align:left; font-weight:bold; font-size:10px;">
                                Caracteristicas:
                            </div>
                            <div style="width:100%; text-align:left;">
                                <asp:Image ID="imgFumador" runat="server" Height="25" Width="25" ImageUrl="~/Styles/images/nofumador.png"/>
                                <span style="width:10px;"></span>
                                <asp:Image ID="imgVehiculo" runat="server" Height="25" Width="25" ImageUrl="~/Styles/images/novehiculo.png"/>
                            </div>
                        </div>
                    </section>



    <%--                <section id="datosPesonales" style="float: right; width:100%;">


                        <fieldset>
                            <legend>Teléfono movil:</legend>
                            <asp:Label ID="lblTelefonoMovil" runat="server" Text="No disponible"></asp:Label>               
                        </fieldset>
                        <fieldset>
                            <legend>Teléfono fijo:</legend>
                            <asp:Label ID="lblTelefonoFijo" runat="server" Text="No disponible"></asp:Label>               
                        </fieldset>

                    </section>--%>


                </div> 
            
                <div class="divClear"></div>

                <div style="width:100%; float:left; margin-top:5px;">
                    <div style="width:100%; text-align:center; font-weight:bold; font-size:10px;">
                        Información adicional:
                    </div>
                    <div style="width:100%; text-align:left;">
                        <asp:Label ID="lblInfoAdicional" runat="server" Text="No disponible" Width="100%"></asp:Label>               
                    </div>
                </div>

                <div class="divClear"></div>

                <div id="panelBotonesRespuesta" class="divBotonesPopUp">
                    <asp:Button runat="server" ID="btnCancelarPopUp" CssClass="button-gradient blue" Text="Cerrar" Width="120px" OnClientClick="HideModalPopup(); return false;" />     
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




