<%-- 
    Document   : administracion-de-proyecto
    Created on : 28/02/2019, 05:14:41 PM
    Author     : Daniel Flores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Proyecto 6</title>
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
             w3-button"
             onclick="showCloseNavBlock('navbarblock')">Ingresos</button>
          
          <button
             class="w3-bar-item 
             w3-button
             w3-hide-medium
             w3-hide-small"
             onclick="showModal('modal1')">Egresos</button>
          
          <button 
             class="w3-bar-item 
             w3-button
             w3-hide-medium
             w3-hide-small">Reportes</button>
                    
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
                  onclick="showModal('modal1');
                  showCloseNavBlock('navbarblock')">Egresos</button>
          
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
      </div>
      
      <!--Estado General card-->
      <div class="w3-padding">
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
          <div class="w3-container
               w3-panel
               w3-round-small
               w3-white
               w3-padding-16">
            <h1>Proyecto 6</h1>
            Titular
          </div>
          
          <div class="w3-container
               w3-panel
               w3-round-small
               w3-white
               w3-padding-16">
            <h4>Ingresos</h4>
            Primera Administración: $1,000,000.00
            <br><br>
            <div class="w3-responsive">
              <table class="w3-table-all">
                <tr>
                  <th>Categoria</th>
                  <th>Subcat.</th>
                  <th>Cocepto</th>
                  <th>Monto</th>
                </tr>  

                <tr>
                  <td>GINVER</td>
                  <td>450</td>
                  <td>Seres Vivos</td>
                  <td>$5,000.00 <small>MXN</small></td>
                </tr>

                <tr>
                  <td>GINVER</td>
                  <td>450</td>
                  <td>Material de un solo uso</td>
                  <td>$5,000.00 <small>MXN</small></td>
                </tr>

                <tr>
                  <td>GINVER</td>
                  <td>450</td>
                  <td>costos de publicación</td>
                  <td>$5,000.00 <small>MXN</small></td>
                </tr>

                <tr>
                  <td colspan="4">No hay Ingresos que mostrar</td>
                </tr>
              </table>
            </div>
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

      <!--ingresos tab-->
      <div id="incomes">
      </div>

      <!--egresos tab-->
      <div id="outcomes">
      </div>
    </div>
    
    <!--footer-->
    <%@include file="footer.jsp"%>
  </body>
</html>
