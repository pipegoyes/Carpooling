﻿<%@ Page Title="" Language="C#" MasterPageFile="/Front/Site.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="CrearCuenta.aspx.cs" Inherits="Carpooling.Front.Cuentas.CrearCuenta" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/fineuploader.css" rel="stylesheet">      
    <link href="../../Styles/front-css/RegistroUsuario.css" rel="stylesheet">
    <link href="/Styles/front-css/PublicarViaje.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/General.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="/Scripts/jquery.fineuploader/jquery.fineuploader-3.0.js"></script>
    <script src="/Scripts/front-js/CrearCuenta.js"></script>
</asp:Content>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
<%--    <section class="featured">
        <div id="header_page" class="content-wrapper">
            <hgroup class="title">
                <h1>Cuenta de Carpooling Colombia</h1>
            </hgroup>
            <p>
                <h2>Crea tu cuenta en Carpooling Colombia y comienza a compartir tus viajes con nuestra comunidad.</h2>
            </p>
        </div>
    </section>--%>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="divPaso1Registro">
        <div class="titulo">Paso 1. Información de la Cuenta</div>
        <div class="text">Sumistra la información con la que deseas acceder al sitio.</div>
        
        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Nombre de usuario:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txbIdUsuario" ClientID="txbIdUsuario" runat="server" Text=""></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtNombreUsuario_Validation1" runat="server" ControlToValidate="txbIdUsuario" ErrorMessage="El nombre de usuario es requerido" Display="None" ValidationGroup="ValidacionPaso1"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC1" runat="server" TargetControlID="txtNombreUsuario_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="txtNombreUsuario_Validation2" runat="server" ControlToValidate="txbIdUsuario" ErrorMessage="El nombre de usuario debe tener entre 8 a 50 caracteres" ValidationExpression="^\S{7,49}$" Display="None" ValidationGroup="ValidacionPaso1"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC2" runat="server" TargetControlID="txtNombreUsuario_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="txtNombreUsuario_Validation3" runat="server" ControlToValidate="txbIdUsuario" ErrorMessage="El formato del nombre de usuario proporcionando no es valido" ValidationExpression="^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$" Display="None" ValidationGroup="ValidacionPaso1"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtNombreUsuario_VC3" runat="server" TargetControlID="txtNombreUsuario_Validation3" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Correo electronico:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtCorreoElectronico" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtCorreoElectronico_Validation1" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="El correo electronico es requerido" Display="None" ValidationGroup="ValidacionPaso1"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtCorreoElectronico_VC1" runat="server" TargetControlID="txtCorreoElectronico_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="txtCorreoElectronico_Validation2" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="El formato del correo electronico proporcionado no es valido" ValidationExpression="^[a-z][\w\.]+@([\w\-]+\.)+[a-z]{2,7}$" Display="None" ValidationGroup="ValidacionPaso1"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtCorreoElectronico_VC2" runat="server" TargetControlID="txtCorreoElectronico_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Confirme el correo electronico:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtReCorreoElectronico" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtReCorreoElectronico_Validation1" runat="server" ControlToValidate="txtReCorreoElectronico" ErrorMessage="La confirmación del correo electronico es requerida" Display="None" ValidationGroup="ValidacionPaso1"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtReCorreoElectronico_VC1" runat="server" TargetControlID="txtReCorreoElectronico_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:CompareValidator ID="txtReCorreoElectronico_Validation3" runat="server" ControlToValidate="txtReCorreoElectronico" ControlToCompare="txtCorreoElectronico"  ErrorMessage="La confirmación del correo electronico no coincide" Display="None" ValidationGroup="ValidacionPaso1"></asp:CompareValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtReCorreoElectronico_VC3" runat="server" TargetControlID="txtReCorreoElectronico_Validation3" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Contraseña:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox> 
            </div>
            <asp:RequiredFieldValidator ID="txtContrasena_Validation1" runat="server" ControlToValidate="txtContrasena" ErrorMessage="La constraseña es requerida" Display="None" ValidationGroup="ValidacionPaso1"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC1" runat="server" TargetControlID="txtContrasena_Validation1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="txtContrasena_Validation2" runat="server" ControlToValidate="txtContrasena" ErrorMessage="El formato de la contraseña no es valido" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$" Display="None" ValidationGroup="ValidacionPaso1"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtContrasena_VC2" runat="server" TargetControlID="txtContrasena_Validation2" HighlightCssClass="errorValidacion" ></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Confirme la contraseña:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtReContrasena" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtReContrasena_Validator1" runat="server" ControlToValidate="txtReContrasena" ErrorMessage="La confirmación de la constraseña es requerida" Display="None" ValidationGroup="ValidacionPaso1"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC1" runat="server" TargetControlID="txtReContrasena_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:CompareValidator ID="txtReContrasena_Validator3" runat="server" ControlToValidate="txtReContrasena" ControlToCompare="txtContrasena"  ErrorMessage="La confirmación de la contraseña no coincide" Display="None" ValidationGroup="ValidacionPaso1"></asp:CompareValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtReContrasena_VC3" runat="server" TargetControlID="txtReContrasena_Validator3" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="divClear"></div>

        <div class="divBotonesPopUp">
            <input id="btnSiguientePaso1" type="button" class="button-gradient green" style="display:inline-block; width:120px;" value="Siguiente" causesvalidation="true" validationgroup="ValidacionPaso1"/>
        </div>
        <div class="divClear"></div>
    </div>


    <div id="divPaso2Registro" style="display: none;"> <%----%>
        <div class="titulo">Paso 2. Información Personal</div>
        <div class="text">Sumistra tus datos personales básicos.</div>
        
        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Nombres:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtNombres" runat="server" MaxLength="30"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtNombres_Validator1" runat="server" ControlToValidate="txtNombres" ErrorMessage="El nombre es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtNombres_VC1" runat="server" TargetControlID="txtNombres_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Apellidos:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtApellidos" runat="server" MaxLength="30"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="txtApellidos_Validator1" runat="server" ControlToValidate="txtApellidos" ErrorMessage="El nombre es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="txtApellidos_VC1" runat="server" TargetControlID="txtApellidos_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta" style="margin-bottom: 0 !important;">
            <div class="labelInformacionBasica leftPosition ">Fecha de nacimiento:</div>
            <div class="txbInformacionBasica leftPosition ">
                <div ClientID="fechaNacimiento" style="width: 302px !important;"> 
                    <div class="styled-select" style="width: 80px !important; display:inline-block;">
                        <asp:DropDownList ID="ddlAnioNacimiento" ClientID="ddlAnioNacimiento" runat="server" style="width: 110px !important;">
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
                    </div>
                    <div class="styled-select" style="width: 140px !important; display:inline-block;">
                        <asp:DropDownList ID="ddlMesNacimiento" runat="server" ClientID="ddlMesNacimiento" style="width: 170px !important;"> 
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
                    </div>
                    <div class="styled-select" style="width: 69px !important; display:inline-block;">
                        <asp:DropDownList ID="ddlDiaNacimiento" ClientID="ddlDiaNacimiento" runat="server" Enabled="false" style="width: 100px !important;">
                            <asp:ListItem Value="-1" Text="Día" Selected ="True" ></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:HiddenField ID="hfDiaNacimiento" runat="server" Value="-1" ClientIDMode="Static" />
                </div>
            </div>
            <asp:CustomValidator ID="ddlFechaNacimiento_Validator1" ClientID="ddlFechaNacimiento_Validator1" runat="server" ClientValidationFunction="ValidarFechaNacimiento" ControlToValidate="ddlDiaNacimiento" ErrorMessage="La fecha de nacimiento es requerida" Display="None" ValidationGroup="ValidacionPaso2"></asp:CustomValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ddlFechaNacimiento_VC1" runat="server" TargetControlID="ddlFechaNacimiento_Validator1"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Genero:</div>
            <div class="txbInformacionBasica leftPosition ">
                <div id="generoUsuario" class="seleccionRegistro">
                    <asp:RadioButtonList ID="rblGenero" ClientID="rblGenero" runat="server" RepeatLayout="Flow">
                        <asp:ListItem Text="Hombre" Value="H"></asp:ListItem>
                        <asp:ListItem Text="Mujer" Value="M"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="rblstGenero_Validator1" runat="server" ControlToValidate="rblGenero" ErrorMessage="El genero es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="rblstGenero_VC1" runat="server" TargetControlID="rblstGenero_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div>
            <div class="labelInformacionBasica leftPosition ">Lugar de residencia:</div>
            <div class="txbInformacionBasica leftPosition ">
                <div class="campoCrearCuenta" style="margin-left: 0 !important; margin-top: 0 !important;">
                    <div class="styled-select" style="width: 300px !important; display:block;">
                        <asp:DropDownList ID="ddlPais" runat="server" style="width: 330px !important;"/>
                    </div>
                    <ajaxToolkit:CascadingDropDown ID="cddlPais" runat="server" TargetControlID="ddlPais" SelectedValue="57"
                                                                Category="Pais" PromptText="Seleccione un país" LoadingText="[Cargando paises...]" 
                                                                ServiceMethod="ObtenerPaisesDdl" />
                </div>
                <div class="campoCrearCuenta" style="margin-left: 0 !important;">
                    <div class="styled-select" style="width: 300px !important; display:block;">
                        <asp:DropDownList ID="ddlDepartamento" runat="server" style="width: 330px !important;"/>
                    </div>
                    <ajaxToolkit:CascadingDropDown ID="cddlDepartamento" runat="server" TargetControlID="ddlDepartamento" ParentControlID="ddlPais"
                                                                Category="Departamento" PromptText="Seleccione un departamento" LoadingText="[Cargando departamento...]" 
                                                                ServiceMethod="ObtenerDepartamentosDdl" />
                </div>
                <div class="campoCrearCuenta" style="margin-left: 0 !important;">
                    <div class="styled-select" style="width: 300px !important; display:block;">
                        <asp:DropDownList ID="ddlCiudad" runat="server" style="width: 330px !important;"/>
                    </div>
                    <ajaxToolkit:CascadingDropDown ID="cddlCiudad" runat="server" TargetControlID="ddlCiudad" ParentControlID="ddlDepartamento"
                                                                Category="Ciudad" PromptText="Seleccione una ciudad" LoadingText="[Cargando ciudades...]" 
                                                                ServiceMethod="ObtenerCiudadesDdl" />
                </div>
            </div>
            <asp:RequiredFieldValidator ID="ddlPais_Validator1" runat="server" ControlToValidate="ddlPais" ErrorMessage="El país es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ddlPais_VC1" runat="server" TargetControlID="ddlPais_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RequiredFieldValidator ID="ddlDepartamento_Validator1" runat="server" ControlToValidate="ddlDepartamento" ErrorMessage="El departamento es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ddlDepartamento_VC1" runat="server" TargetControlID="ddlDepartamento_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <asp:RequiredFieldValidator ID="ddlCiudad_Validator1" runat="server" ControlToValidate="ddlCiudad" ErrorMessage="La ciudad es requerido" Display="None" ValidationGroup="ValidacionPaso2"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ddlCiudad_VC1" runat="server" TargetControlID="ddlCiudad_Validator1" HighlightCssClass="errorValidacion"></ajaxToolkit:ValidatorCalloutExtender>
            <div class="divClear"></div>
        </div>

        <div class="divClear"></div>
        <div class="divBotonesPopUp">
            <input id="btnAtrasPaso2" type="button" value="Atras" class="button-gradient blue" style="display:inline-block; width:120px;"/>
            <input id="btnSiguientePaso2" type="button" class="button-gradient green" style="display:inline-block; width:120px;" value="Siguiente"  causesvalidation="true" validationgroup="ValidacionPaso2"/>
        </div>
        <div class="divClear"></div>
    </div>

    <div id="divPaso3Registro" style="display: none;"> <%----%>
        <div class="titulo">Paso 3. Información Adicional</div>
        <div class="text">Sumistra alguna información para que te podamos conocer un poco más.</div>
        
<%--        <div id="div14">
            <div class="labelInformacionBasica leftPosition ">Imagen de perfil:</div>
            <div class="txbInformacionBasica leftPosition ">
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
            </div>
            <div class="divClear"></div>
        </div>--%>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Teléfono fijo:</div>
            <div class="txbInformacionBasica leftPosition">
                <asp:TextBox ID="txtTelefonoFijo" runat="server" MaxLength="15"></asp:TextBox>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Teléfono Movil:</div>
            <div class="txbInformacionBasica leftPosition ">
                <asp:TextBox ID="txtTelefonoMovil" runat="server"  MaxLength="15"></asp:TextBox>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Ocupación:</div>
            <div class="txbInformacionBasica leftPosition ">
                <div class="styled-select">
                    <asp:DropDownList ID="ddlOcupacion" ClientID="ddlOcupacion" runat="server" ></asp:DropDownList>
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">Caracteristicas:</div>
            <div class="txbInformacionBasica leftPosition ">
                <asp:HiddenField ID="hfdPathImagenFumador" runat="server" ClientIDMode="Static" />              
                <asp:HiddenField ID="hfdPathImagenVehiculo" runat="server" ClientIDMode="Static" />              
                <asp:HiddenField ID="hfdPathImagenNoFumador" runat="server" ClientIDMode="Static" />              
                <asp:HiddenField ID="hfdPathImagenNoVehiculo" runat="server" ClientIDMode="Static" />              
                <div class="seleccionRegistro2" style="width: 200px !important; display:inline-block !important;">
                    <asp:Image ID="imgFumador" ClientID="imgFumador" runat="server" Height="35" Width="35" ImageUrl="~/Styles/images/nofumador.png"
                        style="display: inline !important; vertical-align:middle !important; cursor: pointer !important; "/>
                    <asp:CheckBox ID="chkFumador" ClientID="chkFumador" ClientIDMode="Static" runat="server" Text="Soy fumador"
                        style="display: inline-block !important; vertical-align:middle !important; cursor: pointer !important; "/>
                    <asp:HiddenField ID="hfdFumador" runat="server" ClientIDMode="Static" />  
                </div>     
                <div class="seleccionRegistro2" style="width: 200px !important; display:inline-block !important;">       
                    <asp:Image ID="imgVehiculo" ClientID="imgVehiculo" runat="server" Height="35" Width="35" ImageUrl="~/Styles/images/novehiculo.png"
                        style="display: inline !important; vertical-align:middle !important; cursor: pointer !important; "/>
                    <asp:CheckBox ID="chkVehiculo" ClientID="chkVehiculo" ClientIDMode="Static" runat="server" Text="Tengo vehículo"
                        style="display: inline-block !important; vertical-align:middle !important; cursor: pointer !important; "/>
                    <asp:HiddenField ID="hfdVehiculo" runat="server" ClientIDMode="Static" />  
                </div>
            </div>
            <div class="divClear"></div>
        </div>

        <div class="campoCrearCuenta">
            <div class="labelInformacionBasica leftPosition ">¿Algo más que quieras que tus compañeros de viaje conozcan de ti?</div>
            <div class="txbInformacionBasica leftPosition ">
                <asp:TextBox ID="txbInfoAdicional" runat="server" TextMode="MultiLine" Height="90" style="border: 1px solid #C0C0C0 !important;"></asp:TextBox> 
            </div>
            <div class="divClear"></div>
        </div>

        <div class="divClear"></div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="divBotonesPopUp">
                    <input id="btnAtrasPaso3" type="button" value="Atras" class="button-gradient blue" style="display:inline;"/>
                    <asp:Button ID="btnFinalizar" ClientID="btnFinalizar" runat="server" Text="Finalizar" 
                        OnClick="btnFinalizar_Click" CausesValidation="true" ValidationGroup="ValidacionPaso3"
                        CssClass="button-gradient green" style="display:inline-block; width:120px;"/>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="divClear"></div>
    </div>


</asp:Content>
