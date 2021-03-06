﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Carpooling.perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Perfil.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./Scripts/jquery-1.4.1.js"></script>
</head>
<body>

<div id="principal" class="doc">

<div class="privateProfile site clearfix">
	<div class="column">
		<div class="name">
            <asp:Label ID="lblNombresApellidos" runat="server" Text="Nombres Apellidos"></asp:Label>         
		</div>
		<div class="border userInfo">
			<div class="imageWrp">
				<div class="userImg border">				
					    <asp:Image ID="imgFotoPerfil" runat="server"  CssClass="-large" ImageUrl="Resources/imgFotoPerfilHombre.png"/>
				</div>
			</div>
			<div class="stats clearfix">
				<div class="labelCenter">Miembro desde:</div>	
                <div class="textCenter">
                    <asp:Label ID="lblMiembroDesde" runat="server" Text="Marzo 23 de 2011"></asp:Label>                             
                </div>			                
			</div>
		</div>
		<div class="border box">
            <div class="title">Sexo:</div>
			<div class="text">
			    <asp:Label ID="lblSexo" runat="server" Text="Masculino"></asp:Label>
			</div>

            <div class="clearfix"></div>
            <div class="title">Fecha de nacimiento:</div>
			<div class="text">
			    <asp:Label ID="lblFechaNacimiento" runat="server" Text="01/01/2012"></asp:Label>
			</div>

            <div class="clearfix"></div>
            <div class="title">Edad:</div>
			<div class="text">
			    <asp:Label ID="lblEdad" runat="server" Text="01/01/2012"></asp:Label>
			</div>

            <div class="clearfix"></div>
            <div class="title">Ciudad de residencia:</div>
			<div class="text">
			    <asp:Label ID="lblCiudadResidencia" runat="server" Text="Bogota, Colombia"></asp:Label>
			</div>

            <div class="clearfix"></div>
            <div class="title">Ocupación:</div>
			<div class="text">
			    <asp:Label ID="lblOcupacion" runat="server" Text="Ingeniero Civil"></asp:Label>
			</div>

		</div>

        <div class="border box">
            <div class="title">Más Info:</div>
            <div class="clearfix"></div>
			<div class="text">
			    <asp:Label ID="lblMasInfo" runat="server" Text="Colombia, oficialmente República de Colombia, es un país de América ubicado en la zona noroccidental de América del Sur, organizado constitucionalmente como una república unitaria descentralizada.10 Su capital es Bogotá. Su superficie es de 2 070 408 km2, de los cuales 1 141 748 km2 corresponden a su territorio continental y los restantes 928 660 km2 a su extensión marítima, de la cual mantiene diferendos limítrofes con Venezuela y Nicaragua.11 Limita al este con Venezuela y Brasil, al sur con Perú y Ecuador y al noroeste con Panamá; en cuanto a límites marítimos					"></asp:Label>
			</div>
         
        </div>
	</div>
	<div class="body">
		<div class="nameWrp">
			<div class="name">Perfil público de Mariano Gomez</div>
		</div>
		<div class="data border clearfix">
			<div class="age"><span>Fecha Nac: </span>
				
					
						23/01/1977
					
					
				 
			</div>
			<div class="age"><span>Edad: </span>
				
					
						35 años
					
					
				 
			</div>
		</div>
		<div class="data border clearfix">
			<div class="company"><span>Trabajo en: </span>
				
					
						"55social.com"
					
					
				
			</div>
			<div class="university"><span>Estudio en: </span>
				
					
						"UNICEN"
					
					
				
			</div>
			<div class="city"><span>Vive en: </span>
				
					
						Buenos Aires, Capital Federal.
					
					
					
				
			</div>
		</div>
		
		
	</div>

    <div class="site clearfix"></div>
    			<div class="nameWrp ridesTitle">
				<div class="name">Últimos viajes publicados</div>
			</div>	
			<div class="searchResults clearfix">
				


















	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/675/Giribone-700-Buenos-Aires-Argentina-a-Uriarte-1200-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img1">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Giribone 700, Buenos Aire...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Uriarte 1200, Buenos Aire...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 2 / <span class="distance">distancia: 2 km /</span> Colaboración: $5</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
					Viaje Semanal. 
						Sale:  a las 08:00 Hs.
						
						
							Vuelve: viaje solo de ida.
						
				
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/552/Buenos-Aires-Argentina-a-9-de-Julio-5500-Mar-del-Plata-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img2">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Buenos Aires, Argentina
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							9 de Julio 5500, Mar del ...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 1 / <span class="distance">distancia: 410 km /</span> Colaboración: $100</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 29/06/2012 a las 22:00 Hs.
						
					
						Vuelve: viaje solo de ida.
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/491/Humberto-Primo-53-Buenos-Aires-Argentina-a-Giribone-700-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img3">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Humberto Primo 53, Buenos...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Giribone 700, Ciudad Autó...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 4 / <span class="distance">distancia: 10 km /</span> Colaboración: $10</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 17/05/2012 a las 18:00 Hs.
						
					
						Vuelve: viaje solo de ida.
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/449/Humberto-Primo-53-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Giribone-700-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img4">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Humberto Primo 53, Ciudad...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Giribone 700, Ciudad Autó...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 3 / <span class="distance">distancia: 10 km /</span> Colaboración: $7</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 03/05/2012 a las 18:00 Hs.
						
					
						Vuelve: viaje solo de ida.
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/444/Humberto-Primo-53-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Avenida-Córdoba-6500-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img5">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Humberto Primo 53, Ciudad...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Avenida Córdoba 6500, Ciu...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 4 / <span class="distance">distancia: 10 km /</span> Colaboración: $5</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 27/04/2012 a las 18:00 Hs.
						
					
						Vuelve: viaje solo de ida.
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/443/Humberto-Primo-53-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Giribone-700-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img6">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Humberto Primo 53, Ciudad...
						
					</span>
					<span class="true"></span>
					<span class="to">
						
							Giribone 700, Ciudad Autó...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 3 / <span class="distance">distancia: 10 km /</span> Colaboración: $7</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 25/04/2012 a las 19:00 Hs.
					
						Vuelve: 25/04/2012 a las 19:00 Hs.
						
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/442/Giribone-700-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Humberto-Primo-53-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img7">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Giribone 700, Ciudad Autó...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Humberto Primo 53, Ciudad...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 3 / <span class="distance">distancia: 11 km /</span> Colaboración: $10</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
					Viaje Semanal. 
						Sale:  a las 18:00 Hs.
						
						
							Vuelve: viaje solo de ida.
						
				
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/385/Avenida-Cabildo-600-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Laprida-1000-Ciudad-Autónoma-de-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img8">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Avenida Cabildo 600, Ciud...
						
					</span>
					<span class="false"></span>
					<span class="to">
						
							Laprida 1000, Ciudad Autó...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 3 / <span class="distance">distancia: 4 km /</span> Colaboración: $5</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 28/03/2012 a las 18:00 Hs.
						
					
						Vuelve: viaje solo de ida.
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/336/Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Pilar-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img9">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Ciudad Autónoma de Buenos...
						
					</span>
					<span class="true"></span>
					<span class="to">
						
							Pilar, Buenos Aires, Arge...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 1 / <span class="distance">distancia: 58 km /</span> Colaboración: $10</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 10/03/2012 a las 09:00 Hs.
					
						Vuelve: 10/03/2012 a las 12:00 Hs.
						
					
				
			
		</div>
	</a>

	<a class="result clearfix" href="http://vayamosjuntos.com.ar/ride/335/Chacarita-Ciudad-Autónoma-de-Buenos-Aires-Argentina-a-Pilar-Buenos-Aires-Argentina/">
		<div class="clearfix">
			<div class="col1">
				<div class="userImg border">
					<img height="52px" width="52px" src="http://s3.amazonaws.com/carpool-profile/10-1-S.jpg" class=" border" id="Img10">
				</div>
			</div>
			<div class="col2">
				<div class="trip">
					<span class="from">
						Chacarita, Ciudad Autónom...
						
					</span>
					<span class="true"></span>
					<span class="to">
						
							Pilar, Buenos Aires, Arge...
							
						
						
					</span>
				</div>
				<div class="person"><span class="DRIVER"></span> Mariano Gomez / lugares: 3 / <span class="distance">distancia: 50 km /</span> Colaboración: $10</div>
			</div>
			<div class="col3">
				<div class="DRIVER-icon"></div>
			</div>
		</div>
		<div class="detail">
			
				
				
					Viaje Ocasional. 
					Sale: 10/03/2012 a las 09:00 Hs.
					
						Vuelve: 10/03/2012 a las 12:00 Hs.
						
					
				
			
		</div>
	</a>

			</div>
    
</div>































			</div>

</body>
</html>
