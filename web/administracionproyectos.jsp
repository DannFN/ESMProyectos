<%-- 
    Document   : categoria
    Created on : 22/02/2019, 07:06:10 PM
    Author     : Daniel Flores
--%>

<%@page import="Controlador.Procesos.DBOperations"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.Objetos.Proyect"%>
<%@page import="Controlador.Objetos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  /*TODO habilitar código*/
  /*HttpSession sess = request.getSession(false);
  RequestDispatcher rd;
  ArrayList<Proyect> p = null;
  User us = null;
  
  if(sess.isNew() || sess == null || sess.getAttribute("user") == null) {
    request.setAttribute("msg", "Debes Iniciar Sesión");
    rd = request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);
    return;
  }else
  if(sess != null && sess.getAttribute("user") != null) {
    us = (User) sess.getAttribute("user");
    DBOperations dbo = new DBOperations();
    p = dbo.proyects();
  }*/
%>

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
    <script>
      window.onscroll = function() { stickyHeader('sticky-header', 'main-header'); };
      window.onclick = function() { closeModalOutside(event, 'modal1'); };
    </script>
  </head>
  
  <body class="native-color5"
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
          <button 
             class="w3-bar-item 
             w3-button
             w3-hide-medium
             w3-hide-small"
             onclick="showCloseNavBlock('navbarblock')">vista General</button>
          
          <button
             class="w3-bar-item 
             w3-button
             w3-hide-medium
             w3-hide-small"
             onclick="showModal('modal1')">Añadir Proyecto</button>
          
          <button 
             class="w3-bar-item 
             w3-button
             w3-hide-medium
             w3-hide-small">Reportes</button>
          
          <input type="text"
                 id="searchbox"
                 class="w3-bar-item
                 w3-input"
                 placeholder="Filtrar"
                 onkeyup="filterTable('searchbox', 'content-table', 'div-not-found')">
          
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
             onclick="showCloseNavBlock('navbarblock')">&#9776;</a>
        </div>

        <div id="navbarblock" 
             class="w3-bar-block 
             w3-black
             w3-hide 
             w3-hide-large">
          <button class="w3-bar-item 
                  w3-button"
                  onclick="showCloseNavBlock('navbarblock')">vista General</button>
          
          <button class="w3-bar-item 
                  w3-button"
                  onclick="showModal('modal1');
                  showCloseNavBlock('navbarblock')">Añadir Proyecto</button>
          
          <button class="w3-bar-item 
                  w3-button"
                  onclick="showCloseNavBlock('navbarblock')">Reportes</button>
          
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
               l2">
            <b>Titular del Proyecto</b>
          </div>
          
          <div class="w3-col
               l1">
            <b>Fecha de Adición</b>
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
      </div> 
      
      <!--vista general tab-->
      <div id="General"
           class="general-content">       
        <!--tabla-->
        <div class="w3-col
             l2
             m1
             w3-hide-small">
          <!--Empty-->
          &nbsp;
        </div>
        
        <div class="w3-col
             l8
             m10
             s12
             w3-responsive">
          <table id="content-table"
                 class="w3-table-all
                 native-max-standard-width">          
            
          </table>
        </div>
          
        <div class="w3-col
             l2
             m1
             w3-hide-small">
          <!--Empty-->
          &nbsp;
        </div>
        
        <!--manejador de resultados no encontrados-->
        <div id="div-not-found"
             class="w3-text-gray
             w3-center
             w3-padding-64
             w3-hide">
          <b>No se encontraron resultados coincidentes con el filtro</b>
        </div>
      </div>
            
      <!--reportes-->
      <div id="reports"> 
      </div>
    </div>
    
    <!--ventana modal 1-->
    <div id="modal1"
         class="w3-modal
         w3-padding-64">
      <div class="w3-modal-content
           w3-card
           w3-animate-zoom">
        <div class="w3-container
             w3-padding-16
             w3-text-white
             native-color1">
          <span class="w3-button
                w3-display-topright"
                onclick="closeModal('modal1')">&times;</span>
          Añadir nuevo proyecto
        </div>
        <div class="w3-container
             w3-padding
             w3-white">
          <form>
            <label class="w3-text-grey">N° de proyecto</label>
            <input type="number"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyectnumber"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Titular del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="titular"
                   required>
            
            <br>
            
            <input type="submit"
                   class="w3-button
                   w3-round-small
                   w3-black
                   w3-medium
                   w3-hover-green"
                   value="Añadir">
            
            <button class="w3-button
                    w3-metro-dark-red
                    w3-hover-red
                    w3-round-small
                    w3-right"
                    onclick="closeModal('modal1')">cancelar</button>
            
          </form>
        </div>
      </div>
    </div>
    
    <!--footer-->
    <%@include file="footer.jsp"%>
  </body>
</html>
