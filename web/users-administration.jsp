<%-- 
    Document   : users-administration
    Created on : 26/04/2019, 02:20:20 PM
    Author     : elect
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Administración de usuarios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">

    <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
    
    <link rel="stylesheet" type="text/css" href="css/native/w3-overwrited.css">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/responsive-proyects-tables.css">

    <link rel="stylesheet" type="text/css" href="css/w3/w3-theme.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-flat-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
    
    <script type="text/javascript" src="javascript/additionals/jquery.js"></script>
    <script type="text/javascript" src="javascript/w3/w3.js"></script>
    <script type="text/javascript" src="javascript/native/ajax.js"></script>
    <script type="text/javascript" src="javascript/native/scripts.js"></script>
    <script type="text/javascript" src="javascript/native/validations.js"></script>
    <script>
      window.onscroll = function() { stickyHeader('sticky-header'); };
      window.onclick = function() { closeModalOutside(event, 'modal1'); closeModalOutside(event, 'modal2'); closeModalOutside(event, 'modal3'); };
    </script>  
  </head>
  
  <body ondrag="return false" ondrop="return false" class="w3-light-grey">
    <!--barra de navegación, manejadores, efecto sticky bar-->
    <div id="sticky-header" class="w3-card">
      <!--barra de navegación-->
      <div class="w3-row-padding w3-container w3-padding w3-theme-d2">
        <div class="w3-col l1 m1 s2">
          <div class="w3-circle w3-white w3-display-container w3-right native-img-container-small">
            <img src="images/esm-logo.png" alt="Escudo ESM" class="w3-display-middle">
          </div>
        </div>

        <div class="w3-col l10 m10 s8">
          <input type="text" id="searchbox" class="w3-input w3-round-small w3-theme-d1 w3-border-0 native-input-search" placeholder="&#xf002; &nbsp; Filtrar resultados por nombre de usuario" style="font-family:'Trebuchet MS', 'FontAwesome'">
        </div>

        <div class="w3-col l1 m1 s2 w3-center">
          <button class="w3-button w3-theme-d2 w3-hover-theme w3-round-small native-button-navbar w3-hide-small" onclick="showCloseNavBlock('actions-bar')">
            <i class="fa fa-bars fa-lg"></i>
          </button>

          <button class="w3-button w3-theme-d2 w3-hover-theme w3-round-small native-button-navbar w3-hide-large w3-hide-medium" onclick="showCloseNavBlock('actions-bar'); showCloseNavBlock('actions-bar-mobile')">
            <i class="fa fa-bars fa-lg"></i>
          </button>
        </div>
      </div>

      <!--barra de acciones-->
      <div id="actions-bar" class="w3-bar w3-theme-d3 w3-hide">
        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showModal('modal1')">
          <i class="fa fa-plus"></i> Añadir usuario
        </button>

        <a href="proyects-administration.jsp" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
          <i class="fa fa-plus"></i> Administrar proyectos
        </a>

        <form action="LogOut" method="post" class="w3-right">
          <button type="submit" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
            Salir <i class="fas fa-sign-out-alt"></i>
          </button>
        </form>

        <!--barra de acciones mobile-->
        <div id="actions-bar-mobile" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium">
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal1')">
            <i class="fa fa-plus fa-fw"></i> Añadir usuario
          </button>

          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal2')">
            <i class="fa fa-plus fa-fw"></i> Administrar Proyectos
          </button>

          <form action="LogOut" method="post">
            <button type="submit" class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
              <i class="fas fa-sign-out-alt fa-fw"></i> Salir
            </button>
          </form>
        </div>
      </div>

      <!--manejador de error-->
      <div id="error-handler" class="w3-bar w3-container w3-padding w3-win8-magenta w3-hide">
        <span class="w3-bar-item">No se pudo procesar la solicitud, vuelve a intentarlo más tarde</span>
        <button class="w3-bar-item w3-button w3-hover-red w3-round-small w3-right" onclick="showCloseNavBlock('error-handler')"><i class="fas fa-times"></i></button>
      </div>

      <!--manejador de éxito-->
      <div id="success-handler" class="w3-bar w3-container w3-padding w3-win8-green w3-hide">
        <span class="w3-bar-item">Operación exitosa</span>
        <button class="w3-bar-item w3-button w3-hover-green w3-round-small w3-right" onclick="showCloseNavBlock('success-handler')"><i class="fas fa-times"></i></button>
      </div>
    </div>
    
    <!--banner-->
    <div class="w3-center native-banner-background">
      <div class="w3-container w3-text-white native-banner native-inset-shadow">
        <div class="w3-container w3-padding-32 w3-text-white native-banner">
          <span class="w3-hide-small native-banner-text-large">Administración de Usuarios</span> 
          <br>
          Sesión de administrador actual: Nombre de Usuario del Administrador
        </div>
      </div>
    </div>
    
    <!--contenido de la página-->
    <div class="w3-row native-main">
      <div class="w3-col l1 m1 w3-hide-small">
        <!--vacio-->
        &nbsp;
      </div>
      
      <div class="w3-col l10 m10 s12">
        <!--contenido de los usuarios-->
        <br class="w3-hide-small">
        <table class="w3-card">
          <thead>
            <tr class="w3-metro-dark-blue">
              <th colspan="4" class="w3-container w3-padding-16 w3-large">Lista de Usuario</th> 
            </tr>

            <tr class="w3-pale-blue">
              <td>Usuario</td>
              <td>Nivel de acceso</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </thead>
          
          <tbody>
            <tr>
              <td class="w3-center w3-xlarge"></td>
              <td></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <div class="w3-col l1 m1 w3-hide-small">
        <!--vacio-->
        &nbsp;
      </div>
    </div>
    
    <!--pie de página-->
    <footer class="w3-padding-16 w3-cell-row w3-metro-darken">
      <div class="w3-container w3-cell w3-cell-middle">
        <a href="#">Aviso de privacidad</a>
      </div>
    </footer> 
  </body>
</html>
