<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil3.aspx.cs" Inherits="Carpooling.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/Perfil3.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="perfilUsuaio" class="titulo">
        <asp:Label ID="lblNombreApellido" runat="server" Text="Nombres Apellidos"></asp:Label>    
    </div>    
    <div id="divDatosPersonales" class="columnaIzquierda">        
        <div id="divContenerdor1" class="datosContenedor">
            <div id="divFotoUsuario" class="marcoImagen">
                <asp:Image ID="imgFotoPerfil" CssClass="imagenFoto" runat="server" ImageUrl="Resources/imgFotoPerfilHombre.png"/>
            </div>
            <div id="divPieFoto">                
                Miembro desde:
                <div>
                    <asp:Label ID="lblMiembroDesde" runat="server" Text="Marzo 23 de 2011"></asp:Label>     
                </div>                
            </div>
        </div>
        
        <div id="divContenedor2" class="datosContenedor">
            <div id="datoSexo" class="subtitulo1">
                Sexo:
                <asp:Label ID="lblSexoUsuario" CssClass="subtitulo2" runat="server" Text="Masculino"></asp:Label>
            </div>
            <div id="datoFechaNacimiento" class="subtitulo1">
                Fecha de nacimiento:
                <asp:Label ID="lblFechaNacimientoUsuario" CssClass="subtitulo2" runat="server" Text="12/12/1990"></asp:Label>
            </div>
            <div id="datoEdad" class="subtitulo1">
                Edad:                
                <span class="subtitulo2">
                    <asp:Label ID="lblEdad" runat="server" Text="28"></asp:Label>
                    Años
                </span>
            </div>
            <div id="datoCiudadResidencia" class="subtitulo1">
                Ciudad de residencia:
                <asp:Label ID="lblCiudadResidencia" CssClass="subtitulo2" runat="server" Text="Bogotá D.C."></asp:Label>
            </div>
            <div id="datoOcupacion" class="subtitulo1">
                Ocupacion:
                <asp:Label ID="lblOcupacion" CssClass="subtitulo2" runat="server" Text="Ingeniero"></asp:Label>
            </div>            
        </div>
        <div id="divContenedor3" class="datosContenedor">
            <div id="datoMasInfo" class="subtitulo1">
                Mas info:
                <asp:Label ID="lblMasInfo" CssClass="subtitulo2" runat="server">
                    Wikis serve many different purposes, such as knowledge management and notetaking. Wikis can be community websites and intranets, for example. Some permit control over different functions (levels of access). For example, editing rights may permit changing, adding or removing material. Others may permit access without enforcing access control. Other rules may also be imposed for organizing content.
                </asp:Label>
            </div>                
        </div>
    </div>
    <div id="divUltimoViajes" class="columnaDerecha">
        <asp:HyperLink ID="vije1" runat="server">
            <div id="lineaDatosViaje" class="datosLineaViaje">                
            </div>
        </asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server">
            <div id="Div1" class="datosLineaViaje">                
            </div>
        </asp:HyperLink>
    </div>
</asp:Content>
