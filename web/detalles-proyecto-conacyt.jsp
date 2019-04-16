<%-- 
    Document   : detalles-proyecto
    Created on : 1/04/2019, 05:15:43 PM
    Author     : elect
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
  User us = null;
  ConacytProyect p;
  
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
    int cpn = Integer.parseInt(request.getParameter("conacyt-proyect-number")):
    p = dbo.conacytProyect(cpn);
    dbo.closeConnection();
  }*/ 
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Proyecto N°</title>
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
             m2
             s2">
          <a href="administracion-proyectos.jsp" 
             class="w3-button
             w3-hover-theme">
            <i class="fas 
               fa-arrow-left"></i> 
            <span class="w3-hide-small">Volver</span>
          </a>
        </div>
        
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
             l9
             m8
             s6">
          <input type="text"
                 id="searchbox"
                 class="w3-input
                 w3-round-small
                 w3-theme-d1
                 w3-border-0
                 native-input-search"
                 placeholder=" &#xf002; &nbsp; Filtrar resultados por concepto"
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
      
      <div id="actions-bar"
           class="w3-bar
           w3-theme-d3
           w3-hide">
        
        <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar
                w3-hide-small">
          <i class="far 
             fa-edit"></i> Editar datos del proyecto
        </button>
        
        <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar
                w3-hide-small">
          <i class="fa 
             fa-plus"></i> Añadir ingreso
        </button>
        
        <button class="w3-bar-item
                w3-button
                w3-hover-theme
                native-button-navbar
                w3-hide-small">
          <i class="fa 
             fa-plus"></i> Añadir egreso
        </button>
        
        <form class="w3-right">
          <button type="submit"
                  class="w3-bar-item
                  w3-button
                  w3-hover-theme
                  native-button-navbar
                  w3-hide-small">
            Salir <i class="fa 
                     fa-sign-out-alt"></i>
          </button>
        </form>
        
        <div id="actions-bar-mobile"
             class="w3-bar-block 
             w3-hide 
             w3-hide-large 
             w3-hide-medium">
          
          <button class="w3-bar-item
                  w3-button
                  w3-hover-theme
                  native-button-navbar">
            <i class="far 
               fa-edit
               fa-fw"></i> Editar datos del proyecto
          </button>
          
          <button class="w3-bar-item
                  w3-button
                  w3-hover-theme
                  native-button-navbar">
            <i class="fa 
               fa-plus
               fa-fw"></i> Añadir ingreso
          </button>

          <button class="w3-bar-item
                  w3-button
                  w3-hover-theme
                  native-button-navbar">
            <i class="fa 
               fa-plus
               fa-fw"></i> Añadir egreso
          </button>
          
          <form>
            <button type="submit"
                    class="w3-bar-item
                    w3-button
                    w3-hover-theme
                    native-button-navbar">
              <i class="fa 
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
      <!--banner-->
      <div class="w3-center
           native-banner-background
           native-inset-shadow">
        <div class="w3-container
             w3-text-white
             native-banner">
          <br>
          <span class="w3-hide-small
                native-banner-text-large">Proyecto N°: Nombre del Proyecto</span> 
          <span class="w3-hide-large
                w3-hide-medium
                native-banner-text-small">Proyecto N°: Nombre del Proyecto</span> 
          <br>
          Titular: Titular del proyecto
        </div>
      </div>
      
      <div>
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
             s12">
          <!--ingresos-->
          <div class="w3-panel">
            <!--header ingresos-->
            <div class="w3-container
                 w3-padding-16 
                 w3-xlarge
                 w3-green">
              <i class="fas 
                 fa-arrow-down
                 fa-1x"></i> Ingresos
            </div>
            
            <!--contenedor ingresos-->
            <div class="w3-container
                 w3-padding-16
                 w3-white">
              <!--total de las administraciones-->
              <div class="w3-row">
                <div class="w3-col
                     l7
                     m4
                     w3-hide-small">
                  <!--empty-->
                  &nbsp;
                </div>
                
                <div class="w3-col
                     l5
                     m8
                     w3-hide-small
                     w3-large">
                  <span class="w3-large
                        w3-text-dark-grey">Total de ingresos:</span>
                  <span class="w3-text-green">
                    <b>+ $100,000,000.00</b>
                    <small> MXN</small>
                  </span>
                </div>                
                
                <div class="w3-col
                     w3-hide-large
                     w3-hide-medium
                     s12
                     w3-center
                     w3-padding-16">
                  <div class="w3-large
                       w3-text-dark-grey">
                    Total de ingresos:
                  </div>
                  
                  <div class="w3-text-green">
                    <b>+ $100,000,000.00</b>
                    <small> MXN</small>
                  </div>
                </div>
              </div>
              
              <!--primera administración-->
              <div>
                <div class="w3-container
                     w3-padding-16
                     w3-border-bottom
                     w3-large
                     w3-border-blue
                     w3-text-dark-grey
                     w3-round-medium
                     w3-pale-green">Primera administración</div>

                <!--ingresos inexistentes-->
                <div class="w3-text-grey
                     w3-large
                     w3-center
                     native-padding-top-bottom">
                  No hay ingresos que mostrar
                </div>   
                
                <!--despliegue de los ingresos-->
                <div class="w3-container
                     native-padding-top-bottom">
                  <!--ingreso-->
                  <div class="w3-border-bottom
                       native-margin-top-bottom-small">
                    <div class="w3-row
                         w3-text-deep-purple">
                      <div class="w3-col
                           l7
                           m5
                           s5
                           native-text-elipsis">
                        <b>Concepto</b> 
                      </div>

                      <div class="w3-col
                           l5
                           m7
                           s7">
                        <span class="w3-hide-small">Importe:</span>
                        <span class="w3-text-green
                              w3-hide-small">
                          <b>+ $100,000,000.00</b>
                          <small> MXN</small>
                        </span>
                        <span class="w3-text-green
                              w3-hide-large
                              w3-hide-medium">
                          <b><small>+ $100,000,000.00</small></b>
                        </span>
                      </div>
                    </div>

                    <div class="w3-row 
                         w3-text-grey">
                      <div class="w3-col 
                           l4
                           m6
                           s6">
                        <span class="w3-hide-small
                              w3-medium">Categoria de gasto: GINVER</span>
                        <span class="w3-hide-large
                              w3-hide-medium">Cat.: GINVER</span>
                      </div>
                      <div class="w3-col
                           l4
                           m6
                           s6">
                        <span class="w3-hide-small
                              w3-medium">Subcategoria de gasto: 405</span>
                        <span class="w3-hide-large
                              w3-hide-medium">SubCat.: 405</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!--añadir nuevo ingreso directamente (unicamente para vista large y medium)-->
            <div>
              <div class="w3-hide-small
                   w3-round-small
                   w3-white
                   native-margin-top-bottom-small">
                <div class="w3-row
                     w3-container
                     w3-padding
                     w3-xlarge
                     w3-blue
                     w3-display-container">
                  <span class="w3-button
                        w3-display-topright">&times;</span>
                  <i class="fa 
                     fa-plus
                     fa-fw"></i> Añadir ingreso
                </div>
                
                <div class="w3-container
                     w3-padding">
                  <div class="w3-row-padding">
                    <div class="w3-col
                         l2
                         m4
                         w3-text-deep-purple">
                      <b>Administración:</b> 
                    </div>

                    <div class="w3-col
                         l8
                         m8">
                      <select class="w3-input
                              w3-border
                              w3-round-small
                              native-input-income-outcome">
                        <option>Primera</option>
                        <option>Segunda</option>
                        <option>Tercera</option>
                      </select>
                    </div>
                  </div>

                  <div class="w3-row
                       w3-text-deep-purple
                       native-margin-top-bottom-small">
                    <div class="w3-row-padding
                         w3-col
                         l7
                         m7
                         s5
                         native-text-elipsis">
                      <div class="w3-col
                           l3
                           m12">
                        <b>Concepto:</b>
                      </div>

                      <div class="w3-col
                           l9
                           m12">
                        <input type="text"
                               class="w3-input
                               w3-border
                               w3-round-small
                               native-input-income-outcome">
                      </div>
                    </div>

                    <div class="w3-row-padding
                         w3-col
                         l5
                         m5
                         s7">
                      <div class="w3-col
                           l3
                           m12">
                        <span>Importe:</span>
                      </div>

                      <div class="w3-col
                           l1
                           m2">
                        <b class="w3-text-green">$</b>
                      </div>

                      <div class="w3-col
                           l4
                           m7">
                        <input type="text"
                               class="w3-input
                               w3-border
                               w3-round-small
                               native-input-income-outcome">
                      </div>

                      <div class="w3-col
                           l2
                           m3">
                        <span class="w3-text-green">
                          <small class="w3-text-green
                                 w3-hide-small">&nbsp;MXN</small>
                        </span>
                      </div>
                    </div>
                  </div>

                  <div class="w3-row 
                       w3-text-grey
                       native-margin-top-bottom-small">
                    <div class="w3-row-padding
                         w3-col 
                         l4
                         m6
                         s6">
                      <div class="w3-col
                           l7">
                        <span class="w3-hide-small
                              w3-medium">Categoria de gasto:</span>
                      </div>

                      <div class="w3-col
                           l5">
                        <select class="w3-input
                                w3-border
                                w3-round-small
                                native-input-income-outcome">
                          <option>GINVE</option>
                          <option>GCORR</option>
                        </select>
                      </div>
                    </div>
                    <div class="w3-row-padding
                         w3-col
                         l4
                         m6
                         s6">
                      <div class="w3-col
                           l8">
                        <span class="w3-hide-small
                              w3-medium">Subcategoria de gasto:</span>
                      </div>

                      <div class="w3-col
                           l4">
                        <select class="w3-input
                                w3-border
                                w3-round-small
                                native-input-income-outcome">
                          <option>300</option>
                          <option>405</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div class="w3-container
                       w3-row">
                    <button class="w3-button
                            w3-win8-green
                            w3-hover-green">
                      Añadir
                    </button>

                    <a class="w3-button
                       w3-metro-dark-blue
                       w3-hover-blue">
                      Vaciar campos
                    </a>

                    <a class="w3-button
                       w3-metro-dark-red
                       w3-hover-red">
                      Cerrar
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!--egresos-->
          <div class="w3-panel">
            <!--header egresos-->
            <div class="w3-container
                 w3-padding-16 
                 w3-xlarge
                 w3-metro-dark-red">
              <i class="fas 
                 fa-arrow-up
                 fa-1x"></i> Egresos
            </div>
            
            <!--contenedor egresos-->
            <div class="w3-container
                 w3-padding-16
                 w3-white">
              <!--total de egresos-->
              <div class="w3-row">
                <div class="w3-col
                     l7
                     m4
                     w3-hide-small">
                  <!--empty-->
                  &nbsp;
                </div>
                
                <div class="w3-col
                     l5
                     m8
                     w3-hide-small
                     w3-large">
                  <span class="w3-large
                        w3-text-dark-grey">Total de egresos:</span>
                  <span class="w3-text-red">
                    <b>- $100,000,000.00</b>
                    <small> MXN</small>
                  </span>
                </div>                
                
                <div class="w3-col
                     w3-hide-large
                     w3-hide-medium
                     s12
                     w3-center
                     w3-padding-16">
                  <div class="w3-large
                       w3-text-dark-grey">
                    Total de egresos:
                  </div>
                  
                  <div class="w3-text-red">
                    <b>- $100,000,000.00</b>
                    <small> MXN</small>
                  </div>
                </div>
              </div>
              
              <!--egresos totales-->
              <div>
                <!--ingresos inexistentes-->
                <div class="w3-text-grey
                     w3-large
                     w3-center
                     native-padding-top-bottom">
                  No hay egresos que mostrar
                </div>   
                
                <!--despliegue de los egresos-->
                <div class="w3-container
                     native-padding-top-bottom">
                  <!--egreso-->
                  <div class="w3-border-bottom
                       native-margin-top-bottom-small">
                    <div class="w3-row
                         w3-text-theme">
                      <div class="w3-col
                           l7
                           m5
                           s5
                           native-text-elipsis">
                        <b>Concepto</b> 
                      </div>

                      <div class="w3-col
                           l5
                           m7
                           s7">
                        <span class="w3-hide-small">Importe:</span>
                        <span class="w3-text-red
                              w3-hide-small">
                          <b>- $100,000,000.00</b>
                          <small> MXN</small>
                        </span>
                        <span class="w3-text-red
                              w3-hide-large
                              w3-hide-medium">
                          <b><small>- $100,000,000.00</small></b>
                        </span>
                      </div>
                    </div>
                    
                    <!--foldable de detalles de egresos-->
                    <div class="w3-row 
                         w3-text-grey">
                      <div class="w3-col 
                           l4
                           m6
                           s6">
                        
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!--añadir nuevo egreso directamente (unicamente para vista large y medium)-->
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
