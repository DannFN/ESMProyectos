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
    <script type="text/javascript" src="javascript/native/validations.js"></script>
  </head>
  
  <body class="native-color5"
        ondrag="return false"
        ondrop="return false">
    <!--header-->
    <%@include file="header.jsp"%>
    
    <!--main content-->
    <div class="native-main">
      
      <!--navbar, handlers, sticky bar effect-->
      <div id="sticky-header">
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
                 onkeyup="filterTable('searchbox', 'div-not-found')">
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
                 onkeyup="filterTable('searchbox1', 'div-not-found')">
          <form>
            <button class="w3-bar-item
                  w3-button">Salir</button>
          </form>
        </div>

        <!--manejador de error-->
        <div id="errorHandler"
             class="w3-container 
             w3-win8-magenta
             native-text-white
             w3-padding
             w3-hide"
             role="alert">No se pudo procesar la solicitud</div>

        <!--manejador de exito-->
        <div id="succesHandler"
             class="w3-container 
             w3-win8-green
             native-text-white
             w3-padding
             w3-hide"
             role="alert">Operación Exitosa</div>
        
        <!--mostrar para vista general-->
        <div class="w3-row
             w3-padding
             w3-center
             w3-win8-cyan
             w3-hide-medium
             w3-hide-small">
          <div class="w3-col
               l1">
            <b>N° Proyecto</b>
          </div>
          <div class="w3-col
               l3">
            <b>Titular del Proyecto</b>
          </div>
          <div class="w3-col
               l2">
            <b>Operaciones Realizadas</b>
          </div>
          <div class="w3-col
               l2">
            <b>Saldo Actual</b>
          </div>
          <div class="w3-col
               l4">
            <b>Acciones</b>
          </div>
        </div>
        
        <!--Mostrar para ingresos-->
        <!--Mostrar para egresos-->
      </div> 
      
      <!--vista general tab-->
      <div id="General"
           class="w3-padding-small
           general-content">
        <!--dentro de ciclo for de arraylist-->
        <div class="w3-col
             l12
             w3-padding-16
             w3-white
             w3-round-small
             w3-border
             w3-border-light-grey
             w3-hover-light-grey
             proyect-content">
          <div class="w3-col
               l1
               w3-center">
            <b>6</b>
          </div>

          <div class="w3-col
               l3
               titular">
            María Pérez
          </div>

          <div class="w3-col
               l2
               w3-center
               w3-text-indigo
               native-large-table-text">
            <b>25</b>
          </div>

          <div class="w3-col
               l2
               w3-center
               w3-text-green
               native-large-table-text">
            <b>$1,000,536.22</b>
          </div>

          <div class="w3-col
               l4
               w3-center">
            <button class="w3-button
                    w3-metro-dark-purple
                    w3-hover-purple
                    w3-round-small">
              <i class="fas
                 fa-eye"></i> Ver
            </button>

            <button class="w3-button
                    w3-metro-dark-blue
                    w3-hover-blue
                    w3-round-small">
              <i class="fas
                 fa-edit"></i> Editar
            </button>

            <button class="w3-button
                    w3-metro-dark-red
                    w3-hover-red
                    w3-round-small">
              <i class="fas
                 fa-trash-alt"></i> Eliminar
            </button>
          </div>
        </div>
                
        <!--manejador de resultados no encontrados-->
        <div id="div-not-found"
             class="w3-text-gray
             w3-center
             w3-padding-32
             w3-hide
             w3-card">
          <b>No se Encontraron resultados coincidentes con el filtro</b>
        </div>
      </div>
      
      <!--ingresos-->
      <div id="incomes">
      </div>
      
      <!--egresos-->
      <div id="outcomes">
      </div>
      
      <!--reportes-->
      <div id="reports"> 
      </div>
    </div>
    
    <!--footer-->
    <%@include file="footer.jsp"%>
  </body>
</html>
