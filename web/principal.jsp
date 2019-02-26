<%-- 
    Document   : categoria
    Created on : 22/02/2019, 07:06:10 PM
    Author     : Daniel Flores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Proyectos</title>
    <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
    <link rel="stylesheet" type="text/css" href="css/native/w3overwrited.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/colors.css">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
    <script type="text/javascript" src="javascript/additionals/jquery.js"></script>
    <script type="text/javascript" src="javascript/w3/w3.js"></script>
    <script type="text/javascript" src="javascript/native/scripts.js"></script>
  </head>
  
  <body class="native-color5">
    <!--header-->
    <%@include file="header.jsp"%>
    
    <!--main content-->
    <div class="native-main">
      <div class="w3-bar 
           w3-black
           w3-card">
        <a href="#" 
           class="w3-bar-item 
           w3-button">vista General</a>
        <a href="#" 
           class="w3-bar-item 
           w3-button
           w3-hide-medium
           w3-hide-small">Ingresos</a>
        <a href="#" 
           class="w3-bar-item 
           w3-button
           w3-hide-medium
           w3-hide-small">Egresos</a>
        <a href="#" 
           class="w3-bar-item 
           w3-button
           w3-hide-medium
           w3-hide-small">Reportes</a>
        <input type="text"
               id="searchbox"
               class="w3-bar-item
               w3-input
               w3-hide-medium
               w3-hide-small"
               placeholder="Filtrar"
               onkeyup="filterTable('searchbox', 'mainTable', 'tdNotFound')">
        <form>
          <button class="w3-bar-item
                w3-right
                w3-button
                w3-hide-medium
                w3-hide-small">Salir</button>
        </form>
        <a href="javascript:void(0)" 
           class="w3-bar-item 
           w3-button 
           w3-right 
           w3-hide-large" 
           onclick="shownavblock('navbarblock')">&#9776;</a>
      </div>
      
      <div id="navbarblock" 
           class="w3-bar-block 
           w3-black
           w3-hide 
           w3-hide-large">
        <a href="#" 
           class="w3-bar-item 
           w3-button">Ingresos</a>
        <a href="#" 
           class="w3-bar-item 
           w3-button">Egresos</a>
        <a href="#" 
           class="w3-bar-item 
           w3-button">Reportes</a>
        <input type="text"
               id="searchbox1"
               class="w3-bar-item
               w3-input"
               placeholder="Filtrar"
               onkeyup="filterTable('searchbox1', 'mainTable', 'tdNotFound')">
        <form>
          <button class="w3-bar-item
                w3-button">Salir</button>
        </form>
      </div>
      
      <!--Manejador de error-->
      <div class="w3-container 
           w3-win8-magenta
           native-text-white
           w3-padding
           w3-hide" 
           role="alert">No se pudo procesar la solicitud</div>
      
      <div class="w3-container 
           w3-win8-green
           native-text-white
           w3-padding
           w3-hide" 
           role="alert">Operación Exitosa</div>
      
      <div class="w3-container
           w3-padding-small">
        <div class="w3-responsive
             w3-card">
          <table id="mainTable"
                 class="w3-table
                 w3-striped
                 w3-hoverable">
            <tr class="w3-win8-cyan">
              <th class="w3-center">
                Id Proyecto
              </th>
              <th class="w3-center">
                Titular del proyecto
              </th>
              <th class="w3-center">
                Operaciones realizadas
              </th>
              <th class="w3-center">
                Saldo actual
              </th>
              <th colspan="3"
                  class="w3-center">
                Acciones
              </th>
            </tr>
            
            <!--dentro de ciclo for de arraylist-->
            <tr>
              <td class="w3-center">
                <b>6</b>
              </td>
              <td>
                Luis Fernando Galicia Pérez
              </td>
              <td class="w3-center
                  w3-text-indigo
                  native-large-table-text">
                <b>25</b>
              </td>
              <td class="w3-center
                  w3-text-green
                  native-large-table-text">
                <b>$1,000,536.22</b>
              </td>
              <td>
                <button class="w3-metro-dark-purple
                        w3-display-container
                        w3-circle
                        w3-hover-purple 
                       native-button-medium">
                  <i class="fas
                     fa-eye
                     w3-display-middle"></i>
                </button>
              </td>
              <td>
                <button class="w3-metro-dark-blue
                        w3-display-container
                        w3-circle
                        w3-hover-blue
                        native-button-medium">
                  <i class="fas
                     fa-edit
                     w3-display-middle"></i>
                </button>
              </td>
              <td>
                <button class="w3-metro-dark-red
                        w3-display-container
                        w3-circle
                        w3-hover-red
                        native-button-medium">
                  <i class="fas
                     fa-trash-alt
                     w3-display-middle"></i>
                </button>
              </td>
            </tr>
            
            <tr>
              <td class="w3-center">
                <b>6</b>
              </td>
              <td>
                Maria Pérez
              </td>
              <td class="w3-center
                  w3-text-indigo
                  native-large-table-text">
                <b>25</b>
              </td>
              <td class="w3-center
                  w3-text-green
                  native-large-table-text">
                <b>$1,000,536.22</b>
              </td>
              <td>
                <button class="w3-metro-dark-purple
                        w3-display-container
                        w3-circle
                        w3-hover-purple 
                       native-button-medium">
                  <i class="fas
                     fa-eye
                     w3-display-middle"></i>
                </button>
              </td>
              <td>
                <button class="w3-metro-dark-blue
                        w3-display-container
                        w3-circle
                        w3-hover-blue
                        native-button-medium">
                  <i class="fas
                     fa-edit
                     w3-display-middle"></i>
                </button>
              </td>
              <td>
                <button class="w3-metro-dark-red
                        w3-display-container
                        w3-circle
                        w3-hover-red
                        native-button-medium">
                  <i class="fas
                     fa-trash-alt
                     w3-display-middle"></i>
                </button>
              </td>
            </tr>
            
            
          </table>
          
          <div id="tdNotFound"
              class="w3-text-gray
              w3-panel
              w3-center
              w3-padding-32
              w3-hide">
            <b>No se Encontraron resultados coincidentes con el filtro</b>
          </div>
        </div>
      </div>
    </div>
    
    <!--footer-->
    <%@include file="footer.jsp"%>
  </body>
</html>
