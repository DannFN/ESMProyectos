<%-- 
    Document   : proyects-administration
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
    <title>Administración de proyectos</title>
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
    <script type="text/javascript" src="javascript/native/scripts.js"></script>
    <script type="text/javascript" src="javascript/native/validations.js"></script>
    <script>
      window.onscroll = function() { stickyHeader('sticky-header'); };
      window.onload = function() { document.getElementById('default-open').click(); };
      window.onclick = function() { closeModalOutside(event, 'modal1'); closeModalOutside(event, 'modal2'); };
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
          <input type="text" id="searchbox" class="w3-input w3-round-small w3-theme-d1 w3-border-0 native-input-search" placeholder="&#xf002; &nbsp; Filtrar resultados por nombre de proyecto o titular" style="font-family:'Trebuchet MS', 'FontAwesome'">
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
          <i class="fa fa-plus"></i> Añadir proyecto Conacyt
        </button>

        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showModal('modal2')">
          <i class="fa fa-plus"></i> Añadir proyecto SIP
        </button>

        <form action="LogOut" method="post" class="w3-right">
          <button type="submit" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
            Salir <i class="fas fa-sign-out-alt"></i>
          </button>
        </form>

        <!--barra de acciones mobile-->
        <div id="actions-bar-mobile" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium">
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal1')">
            <i class="fa fa-plus fa-fw"></i> Añadir proyecto Conacyt
          </button>

          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal2')">
            <i class="fa fa-plus fa-fw"></i> Añadir proyecto SIP
          </button>

          <form action="LogOut" method="post">
            <button type="submit" class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
              <i class="fas fa-sign-out-alt fa-fw"></i> Salir
            </button>
          </form>
        </div>
      </div>

      <!--manejador de error-->
      <div id="error-handler" class="w3-container w3-padding w3-win8-magenta w3-hide">
        No se pudo procesar la solicitud
      </div>

      <!--manejador de éxito-->
      <div id="succes-handler" class="w3-container w3-padding w3-win8-green w3-hide">
        Operación exitosa
      </div>
    </div>

    <!--banner + pestañas-->
    <div class="w3-center native-banner-background">
      <!--banner-->
      <div class="w3-container w3-text-white native-banner native-inset-shadow">
          <!--escudos vistas large y medium-->
          <img src="images/logos.png" alt="Escudos IPN. ESM y Conacyt" class="w3-hide-small native-logos-large">

          <!--escudos vista small-->
          <img src="images/logos.png" alt="Escudos IPN. ESM y Conacyt" class="w3-hide-large w3-hide-medium native-logos-small">

          <br>

          <!--texto banner vistas large y medium-->
          <span class="w3-hide-small native-banner-text-large">Vista General de Proyectos</span>
          <!--texto banner vista small-->
          <span class="w3-hide-large w3-hide-medium native-banner-text-small">Vista General de Proyectos</span> 

          <br>

          <small>
            Sistema De Gestión y Consulta de Recursos de Proyectos de Investigación de la Escuela Superior de Medicina
          </small>
      </div>

      <!--pestañas-->
      <div class="w3-row">
        <a href="javascript:void(0)" id="default-open" onclick="openTab(event, 'conacyt-proyects');">
          <div class="w3-col l6 m6 s6 w3-bottombar w3-padding w3-theme w3-border-theme tablink">
            Conacyt
          </div>
        </a>
        <a href="javascript:void(0)" onclick="openTab(event, 'sip-proyects');">
          <div class="w3-col l6 m6 s6 w3-bottombar w3-padding w3-theme w3-border-theme tablink">
            SIP
          </div>
        </a>
      </div>
    </div>

    <!--contenido de la página-->
    <div class="native-main">      
      <!--contenido de los proyectos conacyt-->
      <div id="conacyt-proyects" class="w3-row tab-content">
        <div class="w3-col l2 m1 w3-hide-small">
          <!--vacio-->
          &nbsp;
        </div>

        <div class="w3-col l8 m10 s12">
          <br class="w3-hide-small">
          <table class="w3-card"> 
            <thead>
              <tr class="w3-theme-d2">
                <th colspan="4" class="w3-container w3-padding-16 w3-large">Lista de Proyectos</th> 
              </tr>

              <tr class="w3-theme">
                <td class="w3-center w3-xlarge">N°</td>
                <td><b>Nombre del proyecto</b><br><small>titular del proyecto</small></td>
                <td>Saldo</td>
                <td>&nbsp;</td>
              </tr>
            </thead>

            <tbody>
              <tr class="w3-hide"><!--TODO retirar hide-->
                <td colspan="3" class="w3-center w3-text-grey w3-padding-64">
                  No hay proyectos que mostrar, comienza añadiendo uno haciendo click sobre el botón &nbsp;
                  <i class="fa fa-bars fa-lg"></i>
                </td>
              </tr>
              
              <tr class="w3-hide">
                <td colspan="4" class="w3-padding-64 w3-center w3-text-grey">
                  No hay proyectos coincidentes con la busqueda
                </td>
              </tr>

              <!--fila de proyecto-->
              <tr class="native-td-data">
                <td class="w3-center w3-hide-medium w3-hide-small">
                  <b>6</b>
                </td>
                <td class="native-text-elipsis">
                  <b class="w3-text-blue">proyecto con ratones (texto prueba elipsis)</b> 
                  <br> 
                  <small class="w3-hide-small w3-hide-medium">Jorge Salazar Muñiz (texto prueba elipsis)</small>
                </td>
                <td class="w3-hide-large native-text-elipsis">
                  Jorge Salazar Muñiz (texto prueba elipsis)
                </td>
                <td>
                  <b class="w3-text-green">$100,000,000.00 MXN</b>
                </td>
                <td>
                  <div class="w3-dropdown-click w3-right w3-hide-medium w3-hide-small">
                    <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-cproyect-1')">
                      <i class="fas fa-ellipsis-h"></i>
                    </button>
                    <div id="dropdown-cproyect-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
                      <a href="#" class="w3-bar-item w3-button">
                        Detalles <i class="fas fa-arrow-right fa-fw"></i>
                      </a>
                      <a href="#" class="w3-bar-item w3-button">
                        <i class="fas fa-trash-alt fa-fw"></i> Editar
                      </a>
                      <a href="#" class="w3-bar-item w3-button">
                        <i class="fas fa-edit fa-fw"></i> Eliminar
                      </a>
                    </div>
                  </div>

                  <div class="w3-center w3-hide-large">
                    <button class="w3-button w3-blue w3-round-small w3-small">
                      <i class="fas fa-trash-alt fa-x1"></i> Editar
                    </button>

                    <button class="w3-button w3-win8-magenta w3-round-small w3-small">
                      <i class="fas fa-edit fa-x1"></i> Eliminar
                    </button>

                    <form style="display: inline-block">
                      <button class="w3-button w3-black w3-round-small w3-small">
                        Detalles <i class="fas fa-arrow-right"></i>
                      </button>
                    </form>
                  </div>
                </td>
              </tr>
            </tbody>
          </table> 
        </div>

        <div class="w3-col l2 m1 w3-hide-small">
          <!--vacio-->
          &nbsp;
        </div>
      </div>

      <!--contenido de los proyectos SIP-->
      <div id="sip-proyects" class="w3-row tab-content" style="display: none">
        <div class="w3-col l2 m1 w3-hide-small">
          <!--vacio-->
          &nbsp;
        </div>

        <div class="w3-col l8 m10 s12">
          <br class="w3-hide-small">
          <!--TODO contenido misma dinamica de tabla de proyecto conacyt-->
        </div>

        <div class="w3-col l2 m1 w3-hide-small">
          <!--vacio-->
          &nbsp;
        </div>
      </div>
    </div>
    
    <!--ventana modal 1-->
    <div id="modal1" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal1')" class="w3-button w3-display-topright w3-round-small w3-theme-d4 w3-hover-theme" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-theme-d2">
            <h6>Añadir proyecto Conacyt</h6>
          </div>
          <div class="w3-container w3-padding-16">
            <form autocomplete="off" class="w3-row">
              <div class="w3-col l4 w3-padding">
                <label for="proyect-number">Número de Proyecto</label>
                <input type="number" id="proyect-number" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l8 w3-padding">
                <label for="proyect-number">Nombre del proyecto</label>
                <input type="text" id="proyect-number" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l12 w3-padding">
                <label for="proyect-number">Titular del proyecto</label>
                <input type="text" id="proyect-number" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left">Añadir</button> 
                <a href="javascript:void(0)" class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal1')">Cancelar</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!--ventana modal 2-->
    <div id="modal2" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal2')" class="w3-button w3-display-topright w3-round-small w3-theme-d4 w3-hover-theme" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-theme-d2">
            <h6>Añadir proyecto SIP</h6>
          </div>
          <div class="w3-container w3-padding-16">
            <form autocomplete="off" class="w3-row">
              <!--TODO input para obtener datos de proyecto SIP-->
              
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left">Añadir</button> 
                <a href="javascript:void(0)" class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal1')">Cancelar</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!--ventana modal 3-->
    <div id="modal2" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal2')" class="w3-button w3-display-topright w3-round-small w3-theme-d4 w3-hover-theme" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-theme-d2">
            <h6>Editar Proyecto</h6>
          </div>
          <div class="w3-container w3-padding-16">
            <form autocomplete="off" class="w3-row">
              <!--TODO contenido dinamico para editar proyecto-->
              
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left">Añadir</button> 
                <a href="javascript:void(0)" class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal1')">Cancelar</a>
              </div>
            </form>
          </div>
        </div>
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