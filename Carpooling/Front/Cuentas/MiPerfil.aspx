<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Carpooling.Front.Cuentas.MiPerfil" %>
<%@ Register Src="~/Front/Cuentas/wuc/CambioContrasenia.ascx" TagName="CambioContrasenia" TagPrefix="uc" %>
<%@ Register Src="~/Front/Cuentas/wuc/DesactivarCuenta.ascx" TagName="DesactivarCuenta" TagPrefix="uc" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/front-css/RegistroUsuario.css" rel="stylesheet">
    <link href="/Styles/front-css/PublicarViaje.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/General.css" rel="stylesheet" />

    <style type="text/css">

/* ****************** RatingStar ****************** */
.ratingStar
{
	white-space:nowrap;
	margin:1em;
	height:14px;
}
.ratingStar .ratingItem {
    font-size: 0pt;
    width: 13px;
    height: 12px;
    margin: 0px;
    padding: 0px;
    display: block;
    background-repeat: no-repeat;
	cursor:pointer;
}
.ratingStar .Filled {
    background-image: url("../../Styles/images/rating/ratingStarFilled.png");
}
.ratingStar .Empty {
    background-image: url("../../Styles/images/rating/ratingStarEmpty.png");
}
.ratingStar .Saved {
    background-image: url("../../Styles/images/rating/ratingStarSaved.png");
}

/* ****************** Gauge ****************** */
.ratingGauge
{
	white-space:nowrap;
    font-size: 0pt;
	width:122px;
	height:12px;
	padding:1px 0 1px 1px;
	margin:1em;
	background-color:transparent;
	background-position:top left;
	background-repeat:no-repeat;
	background-image:url("../../Styles/images/rating/ratingGauge.png");
}
.ratingGauge .ratingItem {
    font-size:0pt;
    width:20px;
    height:8px;
    margin:0;
    padding:0;
    display:block;
    background-repeat: repeat-x;
	cursor:e-resize;
}
.ratingGauge .Filled {
    background-color:transparent;
}
.ratingGauge .Empty {
    background-color:#ff0;
}
.ratingGauge .Saved {
    background-color:#f00;
}

/* ****************** Thermometer ****************** */
.ratingThermometer 
{
	white-space:nowrap;
	width:220px;
	height:0px;
	padding:26px 20px 20px 16px;
	margin:1em;
	background-color:transparent;
	background-position:top left;
	background-repeat:no-repeat;
	background-image:url("../../Styles/images/rating/ratingThermometer2.png");
}
.ratingThermometer .ratingItem {
    font-size: 0pt;
    width: 10px;
    height: 8px;
    margin: 0;
    padding: 0;
    display: block;
    background-repeat: repeat-x;
	cursor:e-resize;
}
.ratingThermometer .Filled {
    background-image: url("../../Styles/images/rating/ratingFilled.png");
}
.ratingThermometer .Empty {
    background-image: url("../../Styles/images/rating/ratingEmpty.png");
}
.ratingThermometer .Saved {
    background-image: url("../../Styles/images/rating/ratingSaved.png");
}


    </style>



</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
<%--        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Tu perfil en Carpooling Colombia</h1>
            </hgroup>
            <p>
                <h2>Revisa y ajusta tu perfil y compartelo con la comunidad de Carpooling Colombia</h2>
            </p>
        </div>--%>
    </section>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <section id="tituloPerfil1">
        <asp:Label ID="lblNombresApellidos1" runat="server" Text="No disponible"></asp:Label>
    </section>--%>

    <section id="tituloPerfil" class="titulo" style="border-bottom: 2px solid green; margin-bottom:10px;">
        <asp:Label ID="lblNombresApellidos" runat="server" Text="No disponible" style="padding: 0 5px !important; font-size: 22px !important; font-weight:bold !important; display:inline-block !important; vertical-align: middle !important;"></asp:Label>
    </section>

    <section style="padding: 10px 0; margin-bottom: 10px; width:100%;">
        <figure style="width: 70%; margin: 0 auto; height: 161px;">
            <asp:Image ID="imgImagenCuenta" runat="server" Height="160" Width="160" 
                style="border-radius: 5px; border: solid thin #888888; margin: 0 auto; display:block;"/>
        </figure>
        <div class="divClear"></div>
    </section>

    <section id="datosPesonales">
        <div class="tituloEditarPerfil">1. Información Personal</div>
        
        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important; ">Nombres:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblNombres" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Apellidos:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblApellidos" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Genero:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblGenero" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Fecha de nacimiento:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Ciudad de residencia:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblResidencia" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>
    </section>

    <section id="datosCuenta">
        <div class="tituloEditarPerfil">2. Información de la Cuenta</div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Nombre de usuario:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblIdUsuario" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Correo electronico:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblEmail" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Reputación:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <ajaxToolkit:Rating runat="server" ID="rtgReputación" MaxRating="5" CurrentRating="0" CssClass="ratingStar" ReadOnly="true"
                        StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty" 
                        style="height:14px !important; margin:0 !important; width:70px; display:inline-block; margin-left:8px !important;"></ajaxToolkit:Rating>
                    <asp:Label ID="lblReputación" runat="server" Text="No disponible" style="display:inline-block; margin-left:4px;"></asp:Label>
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Ultimo ingreso:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblFechaUltimoIngreso" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>
    </section>

    <section id="datosAdicionales">
        <div class="tituloEditarPerfil">3. Información Adicional</div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Teléfono fijo:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblTelefonoFijo" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Teléfono movil:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblTelefonoMovil" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Ocupación:</div>
            <div class="labelInformacionBasica leftPosition" style="width:300px; margin:0 0 !important; text-align: left; border-radius: 5px; border: solid thin black; height: 30px; line-height: 30px; vertical-align: middle !important;">
                <div style="display:inline;">
                    <asp:Label ID="lblOcupacion" runat="server" Text="No disponible" style="margin-left:8px;"></asp:Label>               
                </div>
            </div>
            <div class="divClear"></div>
        </div>


        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition" style="margin:0 0 !important;">Caracteristicas:</div>
            <div class="txbInformacionBasica leftPosition">
                <div class="seleccionRegistro2" style="width: 200px !important; display:inline-block !important;">
                    <asp:Image ID="imgFumador" runat="server" Height="35" Width="35" ImageUrl="~/Styles/images/nofumador.png"
                        style="display: inline !important; vertical-align:middle !important;"/>
                    <asp:CheckBox ID="chkFumador" ClientID="chkFumador" ClientIDMode="Static" runat="server" Text="Soy fumador" Enabled="false"
                        style="display: inline-block !important; vertical-align:middle !important;"/>
                </div>
                <div class="seleccionRegistro2" style="width: 200px !important; display:inline-block !important;">
                    <asp:Image ID="imgVehiculo" runat="server" Height="35" Width="35" ImageUrl="~/Styles/images/novehiculo.png"
                        style="display: inline !important; vertical-align:middle !important;"/>
                    <asp:CheckBox ID="chkVehiculo" ClientID="chkVehiculo" ClientIDMode="Static" runat="server" Text="Tengo vehículo" Enabled="false"
                        style="display: inline-block !important; vertical-align:middle !important;"/>
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin:0 0 !important; margin-bottom: 3px !important;">
            <div class="labelInformacionBasica leftPosition">
                <div style="width: 150px; float: right;">Información adicional:</div>
            </div>
            <div class="txbInformacionBasica leftPosition" style="width: 388px !important;">
                <asp:TextBox ID="lblInfoAdicional" runat="server" Text="No disponible" TextMode="MultiLine" Height="80"  Enabled="false" style="border: 1px solid black !important; background-color:rgb(239, 238, 239) !important;"></asp:TextBox>               
            </div>
            <div class="divClear"></div>
        </div>
    </section>

    <section id="botones" class="divBotonesPopUp">
        <asp:UpdatePanel ID="upnMiPerfil" runat="server" >
            <ContentTemplate>
            <asp:Button ID="btnEditarPerfil" ClientID="btnEditarPerfil" runat="server" Text="Editar perfil" CssClass="button-gradient green" style="display:inline-block; width:120px;"
                 OnClick="btnEditarPerfil_Click"/>
                <asp:Button ID="btnCambiarContrasenia" ClientID="btnCambiarContrasenia" runat="server" Text="Cambiar contraseña" CssClass="button-gradient green" 
                    style="display:inline-block; width:120px;" OnClick="btnCambiarContrasenia_Click"/>
                <asp:Button ID="btnDesactivarCuenta" ClientID="btnDesactivarCuenta" runat="server" Text="Desactivar cuenta" CssClass="button-gradient blue" 
                    style="display:inline-block; width:120px;" OnClick="btnDesactivarCuenta_Click"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

    <uc:CambioContrasenia ID="ucCambioContrasenia" runat="server"/>
    <uc:DesactivarCuenta ID="ucDesactivarCuenta" runat="server"/>
</asp:Content>