<%@ Page Title="" Language="C#" MasterPageFile="~/Front/Site.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="EditarPerfil.aspx.cs" Inherits="Carpooling.Front.Cuentas.EditarPerfil" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="/Scripts/jquery.fineuploader/jquery.fineuploader-3.0.js"></script>
    <script src="/Scripts/front-js/EditarPerfil.js"></script>
</asp:Content>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Tu perfil en CarpoolingCo</h1>
            </hgroup>
            <p>
                <h2>Revisa y ajusta tu perfil y compartelo con la comunidad de CarpoolingCo</h2>
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hfMensajes" runat="server" Value="" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <section id="tituloPerfil">
        <asp:Label ID="lblNombresApellidos" runat="server" Text="No disponible"></asp:Label>
        <span> - </span>
        <asp:Label ID="lblNombreCuenta" runat="server" Text="No disponible"></asp:Label>
    </section>

    <section id="datosPesonales">
        <fieldset>
            <span>
                Nombres:
            </span>
            <asp:TextBox ID="txbNombres" runat="server" Text="No disponible"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <span>
                Apellidos:
            </span>
            <asp:TextBox ID="txbApellidos" runat="server" Text="No disponible"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <span>
                Ciudad de residencia:
            </span>
            <asp:DropDownList ID="ddlPais" runat="server"/>
            <ajaxToolkit:CascadingDropDown ID="cddlPais" runat="server" TargetControlID="ddlPais" SelectedValue="57"
                                        Category="Pais" PromptText="Seleccione un país" LoadingText="[Cargando paises...]" 
                                        ServiceMethod="ObtenerPaisesDdl" ServicePath="~/WebServices/SiteWebMethod.asmx"/>
            <asp:DropDownList ID="ddlDepartamento" runat="server"/>
            <ajaxToolkit:CascadingDropDown ID="cddlDepartamento" runat="server" TargetControlID="ddlDepartamento" ParentControlID="ddlPais"
                                        Category="Departamento" PromptText="Seleccione un departamento" LoadingText="[Cargando departamento...]" 
                                        ServiceMethod="ObtenerDepartamentosDdl" ServicePath="~/WebServices/SiteWebMethod.asmx"/>
            <asp:DropDownList ID="ddlCiudad" runat="server"/>
            <ajaxToolkit:CascadingDropDown ID="cddlCiudad" runat="server" TargetControlID="ddlCiudad" ParentControlID="ddlDepartamento"
                                        Category="Ciudad" PromptText="Seleccione una ciudad" LoadingText="[Cargando ciudades...]" 
                                        ServiceMethod="ObtenerCiudadesDdl" ServicePath="~/WebServices/SiteWebMethod.asmx"/>
        </fieldset>
        <fieldset>
            <span>
                Genero:
            </span>
            <div id="generoUsuario">
                <asp:RadioButtonList ID="rblGenero" ClientID="rblGenero" runat="server" >
                    <asp:ListItem Text="Hombre" Value="H"></asp:ListItem>
                    <asp:ListItem Text="Mujer" Value="M"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </fieldset>
        <fieldset>
            <span>
                Fecha de nacimiento:
            </span>
            <div ClientID="fechaNacimiento">
                <asp:DropDownList ID="ddlAnioNacimiento" ClientID="ddlAnioNacimiento" runat="server">
                    <asp:ListItem Value="-1" Text="Año" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2013" Text="2013"></asp:ListItem>
                    <asp:ListItem Value="2012" Text="2012"></asp:ListItem>
                    <asp:ListItem Value="2011" Text="2011"></asp:ListItem>
                    <asp:ListItem Value="2010" Text="2010"></asp:ListItem>
                    <asp:ListItem Value="2009" Text="2009"></asp:ListItem>
                    <asp:ListItem Value="2008" Text="2008"></asp:ListItem>
                    <asp:ListItem Value="2007" Text="2007"></asp:ListItem>
                    <asp:ListItem Value="2006" Text="2006"></asp:ListItem>
                    <asp:ListItem Value="2005" Text="2005"></asp:ListItem>
                    <asp:ListItem Value="2004" Text="2004"></asp:ListItem>
                    <asp:ListItem Value="2003" Text="2003"></asp:ListItem>
                    <asp:ListItem Value="2002" Text="2002"></asp:ListItem>
                    <asp:ListItem Value="2001" Text="2001"></asp:ListItem>
                    <asp:ListItem Value="2000" Text="2000"></asp:ListItem>
                    <asp:ListItem Value="1999" Text="1999"></asp:ListItem>
                    <asp:ListItem Value="1998" Text="1998"></asp:ListItem>
                    <asp:ListItem Value="1997" Text="1997"></asp:ListItem>
                    <asp:ListItem Value="1996" Text="1996"></asp:ListItem>
                    <asp:ListItem Value="1995" Text="1995"></asp:ListItem>
                    <asp:ListItem Value="1994" Text="1994"></asp:ListItem>
                    <asp:ListItem Value="1993" Text="1993"></asp:ListItem>
                    <asp:ListItem Value="1992" Text="1992"></asp:ListItem>
                    <asp:ListItem Value="1991" Text="1991"></asp:ListItem>
                    <asp:ListItem Value="1990" Text="1990"></asp:ListItem>
                    <asp:ListItem Value="1989" Text="1989"></asp:ListItem>
                    <asp:ListItem Value="1988" Text="1988"></asp:ListItem>
                    <asp:ListItem Value="1987" Text="1987"></asp:ListItem>
                    <asp:ListItem Value="1986" Text="1986"></asp:ListItem>
                    <asp:ListItem Value="1985" Text="1985"></asp:ListItem>
                    <asp:ListItem Value="1984" Text="1984"></asp:ListItem>
                    <asp:ListItem Value="1983" Text="1983"></asp:ListItem>
                    <asp:ListItem Value="1982" Text="1982"></asp:ListItem>
                    <asp:ListItem Value="1981" Text="1981"></asp:ListItem>
                    <asp:ListItem Value="1980" Text="1980"></asp:ListItem>
                    <asp:ListItem Value="1979" Text="1979"></asp:ListItem>
                    <asp:ListItem Value="1978" Text="1978"></asp:ListItem>
                    <asp:ListItem Value="1977" Text="1977"></asp:ListItem>
                    <asp:ListItem Value="1976" Text="1976"></asp:ListItem>
                    <asp:ListItem Value="1975" Text="1975"></asp:ListItem>
                    <asp:ListItem Value="1974" Text="1974"></asp:ListItem>
                    <asp:ListItem Value="1973" Text="1973"></asp:ListItem>
                    <asp:ListItem Value="1972" Text="1972"></asp:ListItem>
                    <asp:ListItem Value="1971" Text="1971"></asp:ListItem>
                    <asp:ListItem Value="1970" Text="1970"></asp:ListItem>
                    <asp:ListItem Value="1969" Text="1969"></asp:ListItem>
                    <asp:ListItem Value="1968" Text="1968"></asp:ListItem>
                    <asp:ListItem Value="1967" Text="1967"></asp:ListItem>
                    <asp:ListItem Value="1966" Text="1966"></asp:ListItem>
                    <asp:ListItem Value="1965" Text="1965"></asp:ListItem>
                    <asp:ListItem Value="1964" Text="1964"></asp:ListItem>
                    <asp:ListItem Value="1963" Text="1963"></asp:ListItem>
                    <asp:ListItem Value="1962" Text="1962"></asp:ListItem>
                    <asp:ListItem Value="1961" Text="1961"></asp:ListItem>
                    <asp:ListItem Value="1960" Text="1960"></asp:ListItem>
                    <asp:ListItem Value="1959" Text="1959"></asp:ListItem>
                    <asp:ListItem Value="1958" Text="1958"></asp:ListItem>
                    <asp:ListItem Value="1957" Text="1957"></asp:ListItem>
                    <asp:ListItem Value="1956" Text="1956"></asp:ListItem>
                    <asp:ListItem Value="1955" Text="1955"></asp:ListItem>
                    <asp:ListItem Value="1954" Text="1954"></asp:ListItem>
                    <asp:ListItem Value="1953" Text="1953"></asp:ListItem>
                    <asp:ListItem Value="1952" Text="1952"></asp:ListItem>
                    <asp:ListItem Value="1951" Text="1951"></asp:ListItem>
                    <asp:ListItem Value="1950" Text="1950"></asp:ListItem>
                    <asp:ListItem Value="1949" Text="1949"></asp:ListItem>
                    <asp:ListItem Value="1948" Text="1948"></asp:ListItem>
                    <asp:ListItem Value="1947" Text="1947"></asp:ListItem>
                    <asp:ListItem Value="1946" Text="1946"></asp:ListItem>
                    <asp:ListItem Value="1945" Text="1945"></asp:ListItem>
                    <asp:ListItem Value="1944" Text="1944"></asp:ListItem>
                    <asp:ListItem Value="1943" Text="1943"></asp:ListItem>
                    <asp:ListItem Value="1942" Text="1942"></asp:ListItem>
                    <asp:ListItem Value="1941" Text="1941"></asp:ListItem>
                    <asp:ListItem Value="1940" Text="1940"></asp:ListItem>
                    <asp:ListItem Value="1939" Text="1939"></asp:ListItem>
                    <asp:ListItem Value="1938" Text="1938"></asp:ListItem>
                    <asp:ListItem Value="1937" Text="1937"></asp:ListItem>
                    <asp:ListItem Value="1936" Text="1936"></asp:ListItem>
                    <asp:ListItem Value="1935" Text="1935"></asp:ListItem>
                    <asp:ListItem Value="1934" Text="1934"></asp:ListItem>
                    <asp:ListItem Value="1933" Text="1933"></asp:ListItem>
                    <asp:ListItem Value="1932" Text="1932"></asp:ListItem>
                    <asp:ListItem Value="1931" Text="1931"></asp:ListItem>
                    <asp:ListItem Value="1930" Text="1930"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMesNacimiento" runat="server" ClientID="ddlMesNacimiento"> 
                    <asp:ListItem Value="-1" Text="Mes" Selected="True"></asp:ListItem>  
                    <asp:ListItem Value="1" Text="Enero"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Febrero"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Marzo"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Abril"></asp:ListItem>
                    <asp:ListItem Value="5" Text="Mayo"></asp:ListItem>
                    <asp:ListItem Value="6" Text="Junio"></asp:ListItem>
                    <asp:ListItem Value="7" Text="Julio"></asp:ListItem>
                    <asp:ListItem Value="8" Text="Agosto"></asp:ListItem>
                    <asp:ListItem Value="9" Text="Septiembre"></asp:ListItem>
                    <asp:ListItem Value="10" Text="Octubre"></asp:ListItem>
                    <asp:ListItem Value="11" Text="Noviembre"></asp:ListItem>
                    <asp:ListItem Value="12" Text="Diciembre"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlDiaNacimiento" ClientID="ddlDiaNacimiento" runat="server" Enabled="false">
                    <asp:ListItem Value="-1" Text="Día" Selected ="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:HiddenField ID="hfDiaNacimiento" runat="server" Value="-1" ClientIDMode="Static" />
            </div>
        </fieldset>
        <fieldset>
            <span>
                Ocupación:
            </span>
            <asp:DropDownList ID="ddlOcupacion" ClientID="ddlOcupacion" runat="server" ></asp:DropDownList>
        </fieldset>
        <fieldset>
            <span>
                Teléfono movil:
            </span>
            <asp:TextBox ID="txbTelefonoMovil" runat="server" Text="No disponible"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <span>
                Teléfono fijo:
            </span>
            <asp:TextBox ID="txbTelefonoFijo" runat="server" Text="No disponible"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <asp:Image ID="imgFumador" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/orderedList0.png"/>
            <asp:CheckBox ID="chkFumador" runat="server" Text="Soy fumador"/>
            <asp:Image ID="imgVehiculo" runat="server" Height="50" Width="50" ImageUrl="~/Styles/images/orderedList0.png"/>
            <asp:CheckBox ID="chkVehiculo" runat="server" Text="Tengo vehículo"/>
        </fieldset>
    </section>

    <section id="datosCuenta">
        <fieldset>
            <span>
                Id Usuario:
            </span>
            <asp:TextBox ID="txbIdUsuario" ClientID="txbIdUsuario" runat="server" Text="No disponible" Enabled="false"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <span>
                Email:
            </span>
            <asp:TextBox ID="txbEmail" runat="server" Text="No disponible"></asp:TextBox>               
        </fieldset>
        <fieldset>
            <span>
                Contraseña actual:
            </span>
            <asp:TextBox ID="txbContraseniaActual" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
            <span>
                Nueva contraseña:
            </span>
            <asp:TextBox ID="txbNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
            <span>
                Confirmación nueva contraseña:
            </span>
            <asp:TextBox ID="txbReNuevaContrasenia" runat="server" Text="No disponible" TextMode="Password"></asp:TextBox>
        </fieldset>
    </section>

    <section id="datosAdicionales">
        <fieldset>
            <span>
                Imagen de la cuenta:
            </span>
            <figure>
                <input id="hfdImagePath" type="hidden" name="hfdImagePath" />
                <asp:HiddenField ID="hfdImagePathHombre" runat="server" ClientIDMode="Static" />              
                <asp:HiddenField ID="hfdImagePathMujer" runat="server" ClientIDMode="Static" />              
                <asp:Image ID="imgImagenCuenta" ClientID="imgImagenCuenta" runat="server" Height="160" Width="160"/>
                <asp:LinkButton ID="lnkCambiarFoto" runat="server" OnClientClick="lnkCambiarFoto_OnClick(); return false;">Cambiar imagen</asp:LinkButton>
            </figure>

            <div id="dialogoCambiarFoto" title="Cambiar imagen">
                <asp:UpdatePanel ID="upnCambiarImagen" UpdateMode="Conditional" ChildrenAsTriggers="false" runat="server">
                    <ContentTemplate>
                        <div class="clear-fix-margin" style="text-align: center; vertical-align: middle;">
                            <img id="imagenFotoModal" class="imagenFoto" src="/Styles/images/imgFotoPerfilHombre.jpg" alt="" style="width:150px; height:150px;"/>
                        </div>                        
                        <div id="dialogoBotonesBox" class="clear-fix dialogoBotonesBox" style="margin: 0 auto;">
                            <div id="fine-uploader" class="float-left" style="width: 90px; margin-left: 20px;"></div>
                            <input id="btnQuitarImagen" type="button" value="Quitar" onclick="BtnQuitarImagen_OnClick()" style="margin-left: 4px"></input>
                            <input id="btnAceptarImagen" class="float-right" type="button" value="Aceptar" onclick="onOk_ImageUserModalPopup()" style="margin-right: 20px;"></input>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </fieldset>
        <fieldset>
            <span>
                Información adicional (¿Algo más que quieras que tus compañeros de viaje conozcan de ti?)
            </span>
            <asp:TextBox ID="txbInfoAdicional" runat="server" TextMode="MultiLine" Height="60"></asp:TextBox>
        </fieldset>
    </section>

    <section id="botones">
        <asp:Button ID="btnGuardarCambios" ClientID="btnGuardarCambios" runat="server" Text="Guardar cambios" style="float:left;" OnClick="btnGuardarCambios_Click"/>
    </section>

</asp:Content>
