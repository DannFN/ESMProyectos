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
    <link rel="stylesheet" type="text/css" href="css/native/w3overwrited.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/colors.css">
    <link rel="stylesheet" type="text/css" href="css/native/index.css">
    <script type="text/javascript" src="javascript/native/validations.js"></script>
  </head>
  
  <body>
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
         w3-pink">
      <!--Empty-->
      &nbsp;
    </div>
    
    <!--content-->
    <div>
      <!--header-->
      <%@include file="header.jsp"%>
      <c:if test = "${msg != null}">
          <div class="w3-container 
               w3-red
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
                    <button class="w3-btn
                            w3-round-small
                            w3-black
                            w3-medium
                            w3-hover-text-white
                            native-hover-color1"
                            style="width:100%">Entrar</button>
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
      <%@include file="footer.jsp"%>
    </div>
  </body>
</html>
