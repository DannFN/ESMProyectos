<%-- 
    Document   : index
    Created on : 22/02/2019, 11:24:03 AM
    Author     : Daniel Flores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>index</title>
    <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
    <link rel="stylesheet" type="text/css" href="css/native/w3overwrited.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/colors.css">
    <link rel="stylesheet" type="text/css" href="css/native/index.css">
  </head>
  
  <body>
    <div class="w3-opacity
         native-background
         native-background-1
         native-blur-min">
      <!--Empty-->
      &nbsp;
    </div>
    
    <div class="w3-opacity
         native-background
         w3-pink">
      <!--Empty-->
      &nbsp;
    </div>
    
    <div>
      <header class="w3-bar
              w3-container
              w3-text-white
              native-color1">
        <div class="w3-col
             l2
             w3-hide-medium
             w3-hide-small">
          <!--Empty-->
          &nbsp;
        </div>
        
        <div class="w3-col
             l8
             m12
             s12
             w3-center">
          <div class="w3-bar">
            <div class="w3-bar-item">
              <div class="w3-circle
                   w3-white
                   w3-display-container
                   native-img-container">
                <img src="images/ipn-logo.png"
                     class="w3-display-middle"
                     alt="Escudo IPN">
              </div> 
            </div>

            <div class="w3-bar-item">
              <b>Instituto Politecnico Nacional</b> 
              <span class="w3-hide-small">Escuela Superior de Medicina</span>
            </div>

            <div class="w3-bar-item">
              <div class="w3-circle
                   w3-white
                   w3-display-container
                   native-img-container">
                <img src="images/esm-logo.png"
                     class="w3-display-middle"
                     alt="Escudo IPN">
              </div> 
            </div>
          </div>
        </div>
        
        <div class="w3-col
             l2
             w3-hide-medium
             w3-hide-small">
          <!--Empty-->
          &nbsp;
        </div>
      </header>

      <div class="w3-container
           native-main">
        <div class="native-margin-adaptative">
          <div class="w3-col
               l2">
            <!--Empty-->
            &nbsp;
          </div>

          <div class="w3-col
               l8
               w3-padding-32">
            <div class="w3-container">

              <p class="w3-center
                 w3-text-white
                 w3-hide-small">
                <span class="native-giant-text">Proyectos de Investigación ESM</span>
                <br>
                Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escula Superior de Medicina
                <br><br>
                <b>Iniciar Sesión</b>
              </p>

              <p class="w3-center
                 w3-text-white
                 w3-hide-large
                 w3-hide-medium">
                <span class="native-giant-text-mobile">Proyectos de Investigación ESM</span>
                <br>
                Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escula Superior de Medicina
                <br><br>
                <b>Iniciar Sesión</b>
              </p>
            </div>

            <div>
              <form>
                <div class="w3-row-padding">
                  <div class="w3-col
                       l6
                       m6">
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
                       l6
                       m6">
                    <input type="password"
                           class="w3-input
                           w3-round-small
                           w3-white"
                           id="password"
                           name="password"
                           placeholder="Contraseña"
                           required>
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

      <footer class="w3-container
              w3-text-white
              w3-padding-16
              native-color2">
        Aviso de Priacidad 
      </footer>
    </div>
  </body>
</html>
