<%-- 
	Document   : index
	Created on : 22/02/2019, 11:24:03 AM
	Author     : Daniel Flores
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>index</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta content="width=device-width, initial-scale=1" name="viewport">

  <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
  <link rel="stylesheet" type="text/css" href="css/native/w3-overwrited.css">
  <link rel="stylesheet" type="text/css" href="css/native/all.css">
  <link rel="stylesheet" type="text/css" href="css/native/index.css">
	  
  <link rel="stylesheet" type="text/css" href="css/w3/w3-theme.css">
  <link rel="stylesheet" type="text/css" href="css/w3/w3-flat-colors.css">
  <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
  <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
  
  <script type="text/javascript" src="javascript/native/validations.js"></script>
	</head>
	
	<body ondrag="return false" ondrop="return false">
		<!--imagen background-->
		<div class="w3-opacity native-background native-background-1 native-blur">
			<!--vacio-->
			&nbsp;
		</div>

		<!--color background-->
		<div class="w3-opacity native-background w3-theme-l2">
			<!--vacio-->
			&nbsp;
		</div>

		<!--contenido de la pagina-->
		<!--header-->
		<header class="w3-container w3-padding-16 w3-theme-d2">
			<div class="w3-row">
				<!--escudo 1-->
				<div class="w3-col l4 m3 s2">
					<!--escudo 1 vista large-->
					<div class="w3-circle w3-white w3-right w3-display-container w3-hide-medium w3-hide-small native-img-container-large">
						<img src="images/ipn-logo.png" alt="Escudo IPN" class="w3-display-middle">
					</div>

					<!--escudo 1 vista medium-->
					<div class="w3-circle w3-white w3-right w3-display-container w3-hide-large w3-hide-small native-img-container-medium">
						<img src="images/ipn-logo.png" alt="Escudo IPN" class="w3-display-middle">
					</div>
					
					<!--escudo 1 vista small-->
					<div class="w3-circle w3-white w3-right w3-display-container w3-hide-large w3-hide-medium native-img-container-small">
						<img src="images/ipn-logo.png" alt="Escudo IPN" class="w3-display-middle">
					</div>
				</div>

				<!--cabecera-->
				<div class="w3-col l4 m6 s8 w3-center">
						<b>Instituto Politécnico Nacional</b>
						<br class="w3-hide-small">
						<span class="w3-hide-small">Escuela superior de Medicina</span>
				</div>

				<!--escudo 2-->
				<div class="w3-col l4 m3 s2">
					<!--escudo 2 vista large-->
					<div class="w3-circle w3-white w3-left w3-display-container w3-hide-medium w3-hide-small native-img-container-large">
						<img src="images/esm-logo.png" alt="Escudo ESM" class="w3-display-middle">
					</div>

					<!--escudo 2 vista medium-->
					<div class="w3-circle w3-white w3-left w3-display-container w3-hide-large w3-hide-small native-img-container-medium">
						<img src="images/esm-logo.png" alt="Escudo IPN" class="w3-display-middle">
					</div>
					
					<!--escudo 2 vista small-->
					<div class="w3-circle w3-white w3-left w3-display-container w3-hide-large w3-hide-medium native-img-container-small">
						<img src="images/esm-logo.png" alt="Escudo IPN" class="w3-display-middle">
					</div>
				</div>
			</div>

			<!--subtitulo-->
			<div class="w3-padding-small w3-center w3-hide-small">
				<small>Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escuela Superior de Medicina</small>
			</div>
		</header>

		<!--manejador de errores-->
		<c:if test = "${msg != null}">
			<div class="w3-container w3-padding w3-win8-magenta" role="alert">${msg}</div>
  </c:if>
	
  <!--contenido del cuerpo-->
  <div class="w3-container native-main">
  	<div class="w3-row native-margin-top-adaptative">
  		<div class="w3-col l2">
  			<!--vacio-->
  			&nbsp;
  		</div>

  		<div class="w3-col l8">
  			<!--texto gigante vista large-->
  			<div class="w3-center w3-text-white w3-hide-small">
  				<span class="native-giant-text">Proyectos de Investigación ESM</span>
  				<br><br>
  				<b>Iniciar sesión</b>
  			</div>

					<!--texto gigante vista small-->
					<div class="w3-center w3-text-white w3-hide-large w3-hide-medium">
						<span class="native-giant-text-mobile">Proyectos de Investigación ESM</span>
						<br>
						<small>Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escuela Superior de Medicina</small>
						<br>
						<b>Iniciar sesión</b>
					</div>

					<div>
	  			<form action="LogIn" method="post" autocomplete="off">
	  				<div class="w3-row-padding">
	  					<div class="w3-col l4 m4 s12">
	  						<input type="text" name="user" class="w3-input w3-round-small w3-white" placeholder="Usuario" required="required">
	  						<br class="w3-hide-large w3-hide-medium">
	  					</div>  					
	  					
	  					<div class="w3-col l4 m4 s12">
	  						<input type="password" name="password" class="w3-input w3-round-small w3-white" placeholder="Contraseña" required="required">
	  						<br class="w3-hide-large w3-hide-medium">
	  					</div>

	  					<div class="w3-col l4 m4 s12">
          <button type="submit" class="w3-btn w3-round-small w3-black w3-hover-theme" style="width: 100%" >Entrar</button>
        </div>
	  				</div>
	  			</form>
	  		</div>
  		</div>

  		<div class="w3-col l2">
  			<!--vacio-->
  			&nbsp;
  		</div>
  	</div>
  </div>

  <!--pie de página-->
  <footer class="w3-padding-16 w3-cell-row w3-metro-darken">
  	<div class="w3-container w3-cell w3-cell-middle">
  		<a href="#">Aviso de Privacidad</a>
  	</div>
  </footer>
	</body>
</html>