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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>index</title>
    <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-theme.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-flat-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-ios-colors.css">
    <link rel="stylesheet" type="text/css" href="css/native/w3overwrited.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/index.css">
    
    <script type="text/javascript" src="javascript/native/validations.js"></script>
  </head>
  
  <body ondrag="return false"
        ondrop="return false">
    <!--image background-->
    <div class="w3-opacity
         native-background
         native-background-1
         native-blur">
      <!--Empty-->
      &nbsp;
    </div>
    
    <!--color background-->
    <div class="w3-opacity
         native-background
         w3-theme-l2">
      <!--Empty-->
      &nbsp;
    </div>
    
    <!--content-->
    <!--header-->
    <div class="w3-container
         w3-padding
         w3-text-white
         w3-theme-d2">
      <div class="w3-col
           l12
           m12
           s12
           w3-center">
        <div class="w3-row">
          <!--escudo 1 vista large-->
          <div class="w3-col
               l4
               w3-hide-medium
               w3-hide-small">
            <div class="w3-circle
                 w3-white
                 w3-right
                 w3-display-container
                 native-img-container-large">
              <img src="images/ipn-logo.png"
                   class="w3-display-middle"
                   alt="Escudo IPN">
            </div> 
          </div>

          <!--escudo 1 vista medium-->      
          <div class="w3-col
               m3
               w3-hide-large
               w3-hide-small">
            <div class="w3-circle
                 w3-white
                 w3-right
                 w3-display-container
                 native-img-container-medium">
              <img src="images/ipn-logo.png"
                   class="w3-display-middle"
                   alt="Escudo IPN">
            </div> 
          </div>

          <!--escudo 1 vista small-->
          <div class="w3-col
               s2
               w3-hide-large
               w3-hide-medium">
            <div class="w3-circle
                 w3-white
                 w3-right
                 w3-display-container
                 native-img-container-small">
              <img src="images/ipn-logo.png"
                   class="w3-display-middle"
                   alt="Escudo IPN">
            </div> 
          </div>

          <!--titulo header-->
          <div class="w3-col
               l4
               m6
               s8">
            <p>
              <b>Instituto Politecnico Nacional</b> 
              <span class="w3-hide-small"><br></span>
              <span class="w3-hide-small">Escuela Superior de Medicina</span>
            </p>
          </div>

          <!--escudo 2 vista large-->
          <div class="w3-col
               l4
               w3-hide-medium
               w3-hide-small">
            <div class="w3-circle
                 w3-white
                 w3-left
                 w3-display-container
                 native-img-container-large">
              <img src="images/esm-logo.png"
                   class="w3-display-middle"
                   alt="Escudo ESM">
            </div> 
          </div>

          <!--escudo 2 vista medium-->
          <div class="w3-col
               m3
               w3-hide-large
               w3-hide-small">
            <div class="w3-circle
                 w3-white
                 w3-left
                 w3-display-container
                 native-img-container-medium">
              <img src="images/esm-logo.png"
                   class="w3-display-middle"
                   alt="Escudo ESM">
            </div> 
          </div>

          <!--escudo 2 vista small-->
          <div class="w3-col
               s2
               w3-hide-large
               w3-hide-medium">
            <div class="w3-circle
                 w3-white
                 w3-left
                 w3-display-container
                 native-img-container-small">
              <img src="images/esm-logo.png"
                   class="w3-display-middle"
                   alt="Escudo ESM">
            </div> 
          </div>
        </div>
      </div>
      
      <!--subtitulo header-->
      <div class="w3-padding-small
           w3-text-white
           w3-center
           w3-hide-small">
        <small>Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escula Superior de Medicina</small>
      </div>
    </div>

    <!--manejador de errores-->
    <c:if test = "${msg != null}">
        <div class="w3-container 
             w3-win8-magenta
             native-text-white
             w3-padding" 
             role="alert">${msg}</div>
    </c:if>

    <!--body content-->
    <div class="w3-container
         native-main">
      <div class="native-margin-adaptative">
        <div class="w3-col
             l2">
          <!--Empty-->
          &nbsp;
        </div>

        <div class="w3-col
             l8">
          <div class="w3-container">
            <p class="w3-center
               w3-text-white
               w3-hide-small">
              <span class="native-giant-text">Proyectos de Investigación ESM</span>
              <br><br>
              <b>Iniciar Sesión</b>
            </p>

            <p class="w3-center
               w3-text-white
               w3-hide-large
               w3-hide-medium">
              <span class="native-giant-text-mobile">Proyectos de Investigación ESM</span>
              <br><br>
              <small>Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escula Superior de Medicina</small>
              <br><br>
              <b>Iniciar Sesión</b>
            </p>
          </div>

          <div>
            <form action="LogIn"
                  method="post"
                  autocomplete="off">
              <div class="w3-row-padding">
                <div class="w3-col
                     l4
                     m4">
                  <input type="text"
                         class="w3-input
                         w3-round-small
                         w3-white"
                         id="user"
                         name="user"
                         placeholder="Usuario"
                         required>

                  <div class="w3-hide-large
                       w3-hide-medium">
                    <br>
                  </div>
                </div>

                <div class="w3-col
                     l4
                     m4">
                  <input type="password"
                         class="w3-input
                         w3-round-small
                         w3-white"
                         id="password"
                         name="password"
                         placeholder="Contraseña"
                         required>

                  <div class="w3-hide-large
                       w3-hide-medium">
                    <br>
                  </div>
                </div>

                <div class="w3-col 
                     l4
                     m4">
                  <input type="submit"
                          class="w3-btn
                          w3-round-small
                          w3-black
                          w3-medium
                          w3-hover-text-white
                          w3-hover-theme"
                          style="width:100%"
                          value="Entrar">
                </div>
              </div>                               
            </form>
          </div>
        </div>

        <div class="w3-col
             l2">
          <!--Empty-->
          &nbsp;
        </div>
      </div>
    </div>

    <!--footer-->
    <footer class="w3-text-white
            w3-padding-16
            w3-cell-row
            w3-metro-darken">
      <div class="w3-container 
           w3-cell 
           w3-cell-middle">
        <a href="#">Aviso de Privacidad</a>
      </div>
    </footer>
  </body>
</html>
