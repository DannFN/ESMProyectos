<%-- 
    Document   : categoria
    Created on : 22/02/2019, 07:06:10 PM
    Author     : Daniel Flores
--%>

<%@page import="Controlador.Procesos.DBOperations"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.Objetos. ConacytProyect"%>
<%@page import="Controlador.Objetos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  /*TODO habilitar código*/
  /*
  HttpSession sess = request.getSession(false);
  RequestDispatcher rd;
  ArrayList<ConacytProyect> p = null;
  User us = null;
  
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setDateHeader("Expires", 0);
  response.setHeader("Pragma","no-cache");

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
    <link rel="stylesheet" type="text/css" href="css/w3/w3-theme.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
    <link rel="stylesheet" type="text/css" href="css/native/w3overwrited.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
    
    <script type="text/javascript" src="javascript/additionals/jquery.js"></script>
    <script type="text/javascript" src="javascript/w3/w3.js"></script>
    <script type="text/javascript" src="javascript/native/scripts.js"></script>
    <script type="text/javascript" src="javascript/native/validations.js"></script>
    <script>
      window.onscroll = function() { stickyHeader('sticky-header'); };
      window.onload = function() { document.getElementById('default-open').click(); };
      window.onclick = function() { closeModalOutside(event, 'modal1'); closeModalOutside(event, 'modal2'); };
    </script>
  </head>
  
  <body ondrag="return false"
        ondrop="return false"
        class="w3-light-grey">
    <!--navbar/header, handlers, sticky bar effect-->
    <div id="sticky-header"
         class="w3-card">
      <!--navbar-->
      <div id="main-header"
           class="w3-container
           w3-padding
           w3-text-white
           w3-theme-d2">
        <div class="w3-col
             l1
             m1
             s2">
          <div class="w3-circle
               w3-white
               w3-display-container
               native-img-container-small">
            <img src="images/esm-logo.png"
                 class="w3-display-middle"
                 alt="Escudo ESM">
          </div>
        </div>

        <div class="w3-col
             l10
             m10
             s8">
          <input type="text"
                 id="searchbox"
                 class="w3-input
                 w3-round-small
                 w3-theme-d1
                 w3-border-0
                 native-input-search"
                 placeholder=" &#xf002; &nbsp; Filtrar resultados por nombre de proyecto o titular"
                 style="font-family:'Trebuchet MS', 'FontAwesome'"
                 onkeyup="filterTable('searchbox', 'div-not-found-class')">
        </div>
        
        <div class="w3-col
             l1
             m1
             s2
             w3-center">
          <button class="w3-button
                  w3-theme-d2
                  w3-hover-theme
                  native-button-navbar
                  w3-hide-small"
                  onclick="showCloseNavBlock('actions-bar')">
            <i class="fa 
               fa-bars
               fa-lg"></i>
          </button>
          
          <button class="w3-button
                  w3-theme-d2
                  w3-hover-theme
                  native-button-navbar
                  w3-hide-large
                  w3-hide-medium"
                  onclick="showCloseNavBlock('actions-bar'); showCloseNavBlock('actions-bar-mobile')">
            <i class="fa 
               fa-bars
               fa-lg"></i>
          </button>
        </div>
      </div>
      
      <!--actionbar-->
      <div id="actions-bar"
           class="w3-bar
           w3-theme-d3
           w3-hide">
        <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar
                w3-hide-small"
                onclick="showModal('modal1')">
          <i class="fa 
               fa-plus"></i> Añadir proyecto Conacyt
        </button>
        
        <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar
                w3-hide-small"
                onclick="showModal('modal2')">
          <i class="fa 
               fa-plus"></i> Añadir proyecto SIP
        </button>
        
        <form class="w3-right">
          <button type="submit"
                  class="w3-bar-item
                  w3-button
                  w3-hover-theme
                  native-button-navbar
                  w3-hide-small">
            Salir <i class="fas 
                     fa-sign-out-alt"></i>
          </button>
        </form>
        
        <!--actionbar vista small-->
        <div id="actions-bar-mobile"
             class="w3-bar-block 
             w3-hide 
             w3-hide-large 
             w3-hide-medium">
          <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar"
                onclick="showModal('modal1')">
            <i class="fa 
               fa-plus
               fa-fw"></i> Añadir proyecto Conacyt
          </button>
          
          <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar"
                onclick="showModal('modal2')">
            <i class="fa 
               fa-plus
               fa-fw"></i> Añadir proyecto SIP
          </button>
          
          <form>
            <button type="submit"
                    class="w3-bar-item
                    w3-button
                    w3-hover-theme
                    native-button-navbar">
              <i class="fas 
                 fa-sign-out-alt
                 fa-fw"></i> Salir 
            </button>
          </form>
        </div>
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
    </div>
    
    <!--main content-->
    <div class="native-main">
      <!--vista general tab-->  
      <div id="General"
           class="native-general-content">
        <div class="w3-center
             native-banner-background">
          <!--banner-->
          <div class="w3-container
               w3-text-white
               native-banner
               native-inset-shadow">
            <img class="w3-hide-small
                 native-logos-large" href="escudos IPN ESM, logo Conacyt" src="images/logos.png">
            <img class="w3-hide-large
                 w3-hide-medium
                 native-logos-small" href="escudos IPN ESM, logo Conacyt" src="images/logos.png">
            <br>
            <span class="w3-hide-small
                  native-banner-text-large">Vista General de Proyectos</span> 
            <span class="w3-hide-large
                  w3-hide-medium
                  native-banner-text-small">Vista General de Proyectos</span> 
            <br>
            <small>Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escuela Superior de Medicina</small>
          </div>
          
          <!--tabs-->
          <div>
            <a href="javascript:void(0)" 
               id="default-open"
               onclick="openTab(event, 'conacyt-proyects');">
              <div class="w3-col
                   l6
                   m6
                   s6
                   w3-bottombar  
                   w3-padding
                   w3-theme
                   w3-border-theme
                   tablink">Conacyt</div>
            </a>
            <a href="javascript:void(0)" 
               onclick="openTab(event, 'sip-proyects');">
              <div class="w3-col
                   l6
                   m6
                   s6
                   w3-bottombar  
                   w3-padding
                   w3-theme
                   w3-border-theme
                   tablink">SIP</div>
            </a>
          </div>
        </div>
        
        <div id="conacyt-proyects"
             class="tab-content">
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
               w3-container
               w3-padding-16">
            
            <div class="w3-text-gray
                 w3-center
                 w3-padding-32">
              <b class="w3-xlarge">No hay proyectos que mostrar</b>
            </div>
            
            <!--contenedor de proyecto Conacyt-->
            <div class="w3-white
                 w3-leftbar
                 w3-border
                 w3-round-small
                 w3-hover-left-border-blue
                 w3-hover-pale-blue
                 native-proyect-container
                 proyect-container-class">
              <div class="w3-row
                   w3-container
                   w3-padding
                   w3-metro-dark-blue">
                <div class="w3-col
                     l10
                     m10
                     s9
                     native-text-elipsis
                     native-proyect-element1
                     proyect-name-class">
                  Nombre del proyecto
                </div>
                
                <div class="w3-col
                     l2
                     m2
                     s3">
                  <div class="w3-dropdown-click
                       w3-right
                       w3-round-small">
                    <button class="w3-button
                            w3-hover-black
                            w3-round-small"
                            onclick="showCloseNavBlock('dropdown-conacyt-proyect-number');">
                      <i class="fas 
                         fa-ellipsis-h"></i>
                    </button>
                    
                    <!--TODO cambiar number por número de proyecto-->
                    <div id="dropdown-conacyt-proyect-number"
                         class="w3-dropdown-content 
                         w3-bar-block 
                         w3-border"
                         style="right: 0">
                      <a href="#" 
                         class="w3-bar-item 
                         w3-button"><i class="far 
                         fa-trash-alt
                         fa-fw"></i> Eliminar</a>
                      <a href="#" 
                         class="w3-bar-item 
                         w3-button">
                        <i class="far 
                           fa-edit
                           fa-fw"></i> Editar</a>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="w3-row
                   w3-container
                   w3-padding">
                <div class="w3-col
                     l9
                     m6
                     s12
                     native-text-elipsis">
                  <span class="proyect-titular-class">Titular del proyecto</span>
                  <br>
                </div>
                
                <div class="w3-col
                     w3-center
                     l3
                     m6
                     s12">
                  <!--vistas medium y large-->
                  <div class="w3-hide-small">
                    <span class="w3-text-dark-grey">Saldo actual:</span>
                    <br>
                    <span class="w3-text-green
                          native-proyect-element1">
                      <small>$</small>100,000,000.00 <small>MXN</small>
                    </span>
                  </div>
                    
                  <!--vista small-->
                  <div class="w3-hide-large
                       w3-hide-medium">
                    <small class="w3-text-dark-grey">Saldo actual:</small>
                    <br>
                    <span class="w3-text-green">
                      <small>$</small>100,000,000.00 <small>MXN</small>
                    </span>
                  </div>
                </div>
                
              </div>
                            
              <div class="w3-row
                   w3-center
                   w3-padding">
                <form action="detalles-proyecto-conacyt.jsp">
                  <input type="number"
                         name="conacyt-proyect-number"
                         hidden>
                  
                  <button class="w3-button
                          w3-round-small
                          w3-black
                          w3-hover-green">
                    ver detalles 
                    <i class="fas 
                       fa-angle-right"></i>
                  </button>
                </form>
              </div>
            </div>
            
            <!--manejador de resultados no encontrados-->
            <div class="w3-text-gray
                 w3-center
                 w3-padding-32
                 w3-hide
                 div-not-found-class">
              <b class="w3-large">No se encontraron resultados coincidentes con el filtro</b>
            </div>
          </div>

          <div class="w3-col
               l2
               m1
               w3-hide-small">
            <!--Empty-->
            &nbsp;
          </div>
        </div>

        <div id="sip-proyects"
             class="tab-content"
             style="display: none">
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
               w3-container
               w3-padding-16">

            <div class="w3-text-gray
                 w3-center
                 w3-padding-32">
              <b class="w3-xlarge">No hay proyectos que mostrar</b>
            </div>
            
            <!--contenedor de proyecto SIP-->
            <div class="w3-white
                 w3-leftbar
                 w3-border
                 w3-round-small
                 w3-hover-left-border-red
                 w3-hover-pale-red
                 native-proyect-container
                 proyect-container-class">
              <div class="w3-row
                   w3-container
                   w3-padding
                   w3-metro-dark-red">
                <div class="w3-col
                     l10
                     m10
                     s9
                     native-text-elipsis
                     native-proyect-element1
                     proyect-name-class">
                  Nombre del proyecto
                </div>
                
                <div class="w3-col
                     l2
                     m2
                     s3">
                  <div class="w3-dropdown-click
                       w3-right
                       w3-round-small">
                    <button class="w3-button
                            w3-hover-black
                            w3-round-small"
                            onclick="showCloseNavBlock('dropdown-sip-proyect-number');">
                      <i class="fas 
                         fa-ellipsis-h"></i>
                    </button>
                    
                    <!--TODO cambiar number por número de proyecto-->
                    <div id="dropdown-sip-proyect-number"
                         class="w3-dropdown-content 
                         w3-bar-block 
                         w3-border"
                         style="right: 0">
                      <a href="#" 
                         class="w3-bar-item 
                         w3-button"><i class="far 
                         fa-trash-alt
                         fa-fw"></i> Eliminar</a>
                      <a href="#" 
                         class="w3-bar-item 
                         w3-button">
                        <i class="far 
                           fa-edit
                           fa-fw"></i> Editar</a>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="w3-row
                   w3-container
                   w3-padding">
                <div class="w3-col
                     l9
                     m6
                     s12
                     native-text-elipsis">
                  <span class="proyect-titular-class">Titular del proyecto</span>
                  <br>
                </div>
                
                <div class="w3-col
                     w3-center
                     l3
                     m6
                     s12">
                  <!--vistas medium y large-->
                  <div class="w3-hide-small">
                    <span class="w3-text-dark-grey">Saldo actual:</span>
                    <br>
                    <span class="w3-text-green
                          native-proyect-element1">
                      <small>$</small>100,000,000.00 <small>MXN</small>
                    </span>
                  </div>
                    
                  <!--vista small-->
                  <div class="w3-hide-large
                       w3-hide-medium">
                    <small class="w3-text-dark-grey">Saldo actual:</small>
                    <br>
                    <span class="w3-text-green">
                      <small>$</small>100,000,000.00 <small>MXN</small>
                    </span>
                  </div>
                </div>
                
              </div>
                            
              <div class="w3-row
                   w3-center
                   w3-padding">
                <form action="detalles-proyecto-conacyt.jsp">
                  <input type="number"
                         name="conacyt-proyect-number"
                         hidden>
                  
                  <button class="w3-button
                          w3-round-small
                          w3-black
                          w3-hover-green">
                    ver detalles 
                    <i class="fas 
                       fa-angle-right"></i>
                  </button>
                </form>
              </div>
            </div>
            
            <!--manejador de resultados no encontrados-->
            <div class="w3-text-gray
                 w3-center
                 w3-padding-32
                 w3-hide
                 div-not-found-class">
              <b>No se encontraron resultados coincidentes con el filtro</b>
            </div>
          </div>

          <div class="w3-col
               l2
               m1
               w3-hide-small">
            <!--Empty-->
            &nbsp;
          </div>
        </div>
      </div>  
    </div>
    
    <!--ventana modal 1-->
    <div id="modal1"
         class="w3-modal
         w3-padding-16">
      <div class="w3-modal-content
           w3-card
           w3-animate-zoom">
        <div class="w3-container
             w3-padding-16
             w3-text-white
             w3-theme">
          <span class="w3-button
                w3-display-topright"
                onclick="closeModal('modal1')">&times;</span>
          <h4>Añadir nuevo proyecto Conacyt</h4>
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
                   name="proyect-number"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Nombre del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-name"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Titular del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-titular"
                   required>
            
            <br>
            
            <input type="submit"
                   class="w3-button
                   w3-round-small
                   w3-black
                   w3-medium
                   w3-hover-green"
                   value="Añadir">

            <a href="javascript:void(0)"
               class="w3-button
               w3-metro-dark-red
               w3-hover-red
               w3-round-small
               w3-right"
               onclick="closeModal('modal1')">
              Cancelar
            </a>
          </form>
        </div>
      </div>
    </div>
    
    <!--ventana modal 2--> 
    <div id="modal2"
         class="w3-modal
         w3-padding-16">
      <div class="w3-modal-content
           w3-card
           w3-animate-zoom">
        <div class="w3-container
             w3-padding-16
             w3-text-white
             w3-theme">
          <span class="w3-button
                w3-display-topright"
                onclick="closeModal('modal2')">&times;</span>
          <h4>Añadir nuevo proyecto SIP</h4>
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
                   name="proyect-number"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Nombre del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-name"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Titular del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-titular"
                   required>
            
            <br>
            
            <input type="submit"
                   class="w3-button
                   w3-round-small
                   w3-black
                   w3-medium
                   w3-hover-green"
                   value="Añadir">

            <a href="javascript:void(0)"
               class="w3-button
               w3-metro-dark-red
               w3-hover-red
               w3-round-small
               w3-right"
               onclick="closeModal('modal2')">
              Cancelar
            </a>
          </form>
        </div>
      </div>
    </div>
    
    <!--ventana modal 3--> <!--TODO script ajax dinamico-->
    <div id="modal2"
         class="w3-modal
         w3-padding-16">
      <div class="w3-modal-content
           w3-card
           w3-animate-zoom">
        <div class="w3-container
             w3-padding-16
             w3-text-white
             w3-theme">
          <span class="w3-button
                w3-display-topright"
                onclick="closeModal('modal2')">&times;</span>
          <h4>Editar proyecto Conacyt N° <!--TODO obtener numero de proyecto--></h4>
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
                   name="proyect-number"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Nombre del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-name"
                   required>
            
            <br>
            
            <label class="w3-text-grey">Titular del proyecto</label>
            <input type="text"
                   class="w3-input
                   w3-round-small
                   w3-border"
                   name="proyect-titular"
                   required>
            
            <br>
            
            <input type="submit"
                   class="w3-button
                   w3-round-small
                   w3-black
                   w3-medium
                   w3-hover-green"
                   value="Añadir">

            <a href="javascript:void(0)"
               class="w3-button
               w3-metro-dark-red
               w3-hover-red
               w3-round-small
               w3-right"
               onclick="closeModal('modal2')">
              Cancelar
            </a>
          </form>
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
        <a href="#">Aviso de privacidad</a>
      </div>
    </footer>
  </body>
</html>