<!--
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
  ConacytProyect p = null;
  
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
-->

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
      <link rel="stylesheet" type="text/css" href="css/native/responsive-incomes-outcomes-tables.css">

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
      </script>
  </head>

  <body ondrag="return false" ondrop="return false" class="w3-light-grey">
    <!--barra de navegación, manejadores, efecto sticky bar-->
    <div id="sticky-header" class="w3-card">
      <!--barra de navegación-->
      <div class="w3-row-padding w3-container w3-padding w3-theme-d2">
        <div class="w3-col l1 m2 s2">
          <a href="proyects-administration.jsp" class="w3-button w3-hover-theme">
            <i class="fas fa-arrow-left"></i> 
            <span class="w3-hide-small">Volver</span>
          </a>
        </div>
        
        <div class="w3-col l1 m1 s2">
          <div class="w3-circle w3-white w3-display-container w3-right native-img-container-small">
            <img src="images/esm-logo.png" alt="Escudo ESM" class="w3-display-middle">
          </div>
        </div>

        <div class="w3-col l9 m8 s6">
          <input type="text" id="searchbox" class="w3-input w3-round-small w3-theme-d1 w3-border-0 native-input-search" placeholder="&#xf002; &nbsp; Filtrar por concepto" style="font-family:'Trebuchet MS', 'FontAwesome'">
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
        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
          <i class="far fa-edit"></i> Editar datos del proyecto
        </button>
        
        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
          <i class="fa fa-plus"></i> Añadir ingreso
        </button>
        
        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
          <i class="fa fa-plus"></i> Añadir egreso
        </button>
        
        <form action="LogOut" method="post" class="w3-right">
          <button type="submit" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
            Salir <i class="fas fa-sign-out-alt"></i>
          </button>
        </form>
        
        <!--barra de acciones mobile-->
        <div id="actions-bar-mobile" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium">
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
            <i class="far fa-edit fa-fw"></i> Editar datos del proyecto
          </button>
          
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
            <i class="fa fa-plus fa-fw"></i> Añadir ingreso
          </button>

          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
            <i class="fa fa-plus fa-fw"></i> Añadir egreso
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
        <div class="w3-container w3-padding-32 w3-text-white native-banner">
          <span class="w3-hide-small native-banner-text-large">Proyecto N°: Nombre del Proyecto</span> 
          <span class="w3-hide-large w3-hide-medium native-banner-text-small">Proyecto N°: Nombre del Proyecto</span> 
          <br>
          Titular: Titular del proyecto
        </div>
      </div>
    </div>

    <!--contenido de la página-->
    <div class="w3-row native-main">
      <div class="w3-col l1 m1 w3-hide-small">
        <!--vacio-->
        &nbsp;
      </div>

      <div class="w3-col l10 m10 s12">
        <br class="w3-hide-small">

        <!--ingresos--->
        <div class="w3-card" style="margin-bottom: 20px">
          <!--header ingresos-->
          <div class="w3-container w3-padding-16 w3-xlarge w3-green">
            <i class="fas fa-arrow-down fa-1x"></i> Ingresos
          </div>

          <!--contenedor ingresos-->
          <div class="w3-container w3-white">
            <div class="w3-row w3-padding-16">
              <div class="w3-col l7 m4 w3-hide-small">
                <!--vacio-->
                &nbsp;
              </div>
              
              <div class="w3-col l5 m8 w3-large w3-hide-small">
                <span class="w3-large w3-text-dark-grey">Total de ingresos:</span>
                <span class="w3-text-green">
                  <b>+ $100,000,000.00</b>
                  <small> MXN</small>
                </span>
              </div>

              <div class="w3-col s12 w3-center w3-hide-large w3-hide-medium">
                <div class="w3-large w3-text-dark-grey">
                  Total de ingresos:
                </div>
                
                <div class="w3-text-green">
                  <b>+ $100,000,000.00</b>
                  <small> MXN</small>
                </div>
              </div>
            </div>

            <div class="w3-padding-16">
              <!--tabla de ingresos de primera administración-->
              <table>
                <thead>
                  <tr class="w3-flat-emerald w3-border-bottom w3-border-green w3-large">
                    <th colspan="5" class="w3-container w3-padding-16 w3-left-align">
                      Primera administración
                    </th>
                  </tr>

                  <tr class="w3-pale-green w3-border-bottom w3-border-green">
                    <td><b>Concepto</b></td>
                    <td>Cat. gasto</td>
                    <td>Subcat. gasto</td>
                    <td><b>Importe (MXN)</b></td>
                    <td>&nbsp</td>
                  </tr>
                </thead>

                <tbody>
                  <tr class="w3-hide"><!--TODO retirar hide-->
                    <td colspan="5" class="w3-center w3-text-grey w3-padding-64">
                      No hay ingresos que mostrar
                      <i class="fa fa-bars fa-lg"></i>
                    </td>
                  </tr>
                  
                  <tr class="w3-hide">
                    <td colspan="5" class="w3-padding-64 w3-center w3-text-grey">
                      No hay proyectos coincidentes con la busqueda
                    </td>
                  </tr>
                  
                  <!--fila de ingreso-->
                  <tr class="native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis"><b>Ratones de laboratorio blancos</b></td>
                    <td class="w3-text-grey">GINVE</td>
                    <td class="w3-text-grey">405</td>
                    <td class="w3-text-green"><b>+$100,000,000.00</b></td>
                    <td>
                      <div class="w3-dropdown-click w3-right w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-income-1')">
                          <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <div id="dropdown-income-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
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
                      </div>
                    </td>
                  </tr>
                  
                  <!--agregar ingreso directamente-->
                  <tr class="w3-white native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis">
                      <label for="income-concept" class="w3-hide-small w3-hide-medium">Concepto</label>
                      <input type="text" id="income-concept" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="expense-category" class="w3-hide-small w3-hide-medium native-text-elipsis">Categoria de gasto</label>
                      <select id="expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">GINVE</option>
                        <option value="2">GCORR</option>
                      </select>
                    </td>
                    <td class="w3-text-grey">
                      <label for="expense-subcategory" class="w3-hide-small w3-hide-medium native-text-elipsis">subcategoria de gasto</label>
                      <select id="expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="405">405</option>
                        <option value="200">200</option>
                      </select>
                    </td>
                    <td class="w3-text-green">
                      <label for="income-amount" class="w3-hide-small w3-hide-medium">Importe</label>
                      <input type="number" id="income-amount" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td>
                      &nbsp;
                    </td>
                  </tr>
                                    
                  <tr class="w3-white">
                    <td colspan="5" class="w3-padding w3-center">
                      <div class="w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small">
                          Cancelar <i class="fas fa-times fa-x1"></i>
                        </button>
                      </div>
                      
                      <div class="w3-hide-large">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small w3-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small w3-small">
                          Cancelar <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              
              <!--tabla de ingresos de segunda administración-->
              <table>
                <thead>
                  <tr class="w3-flat-emerald w3-border-bottom w3-border-green w3-large">
                    <th colspan="5" class="w3-container w3-padding-16 w3-left-align">
                      Segunda administración
                    </th>
                  </tr>

                  <tr class="w3-pale-green w3-border-bottom w3-border-green">
                    <td><b>Concepto</b></td>
                    <td>Cat. gasto</td>
                    <td>Subcat. gasto</td>
                    <td><b>Importe (MXN)</b></td>
                    <td>&nbsp</td>
                  </tr>
                </thead>

                <tbody>
                  <tr class="w3-hide"><!--TODO retirar hide-->
                    <td colspan="5" class="w3-center w3-text-grey w3-padding-64">
                      No hay ingresos que mostrar
                      <i class="fa fa-bars fa-lg"></i>
                    </td>
                  </tr>
                  
                  <tr class="w3-hide">
                    <td colspan="5" class="w3-padding-64 w3-center w3-text-grey">
                      No hay proyectos coincidentes con la busqueda
                    </td>
                  </tr>
                  
                  <!--fila de ingreso-->
                  <tr class="native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis"><b>Ratones de laboratorio blancos</b></td>
                    <td class="w3-text-grey">GINVE</td>
                    <td class="w3-text-grey">405</td>
                    <td class="w3-text-green"><b>+$100,000,000.00</b></td>
                    <td>
                      <div class="w3-dropdown-click w3-right w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-income-1')">
                          <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <div id="dropdown-income-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
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
                      </div>
                    </td>
                  </tr>
                  
                  <!--agregar ingreso directamente-->
                  <tr class="w3-white native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis">
                      <label for="income-concept" class="w3-hide-small w3-hide-medium">Concepto</label>
                      <input type="text" id="income-concept" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="expense-category" class="w3-hide-small w3-hide-medium native-text-elipsis">Categoria de gasto</label>
                      <select id="expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">GINVE</option>
                        <option value="2">GCORR</option>
                      </select>
                    </td>
                    <td class="w3-text-grey">
                      <label for="expense-subcategory" class="w3-hide-small w3-hide-medium native-text-elipsis">subcategoria de gasto</label>
                      <select id="expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="405">405</option>
                        <option value="200">200</option>
                      </select>
                    </td>
                    <td class="w3-text-green">
                      <label for="income-amount" class="w3-hide-small w3-hide-medium">Importe</label>
                      <input type="number" id="income-amount" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td>
                      &nbsp;
                    </td>
                  </tr>
                                    
                  <tr class="w3-white">
                    <td colspan="5" class="w3-padding w3-center">
                      <div class="w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small">
                          Cancelar <i class="fas fa-times fa-x1"></i>
                        </button>
                      </div>
                      
                      <div class="w3-hide-large">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small w3-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small w3-small">
                          Cancelar <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              
              <!--tabla de ingresos de tercera administración-->
              <table>
                <thead>
                  <tr class="w3-flat-emerald w3-border-bottom w3-border-green w3-large">
                    <th colspan="5" class="w3-container w3-padding-16 w3-left-align">
                      Tercera administración
                    </th>
                  </tr>

                  <tr class="w3-pale-green w3-border-bottom w3-border-green">
                    <td><b>Concepto</b></td>
                    <td>Cat. gasto</td>
                    <td>Subcat. gasto</td>
                    <td><b>Importe (MXN)</b></td>
                    <td>&nbsp</td>
                  </tr>
                </thead>

                <tbody>
                  <tr class="w3-hide"><!--TODO retirar hide-->
                    <td colspan="5" class="w3-center w3-text-grey w3-padding-64">
                      No hay ingresos que mostrar
                      <i class="fa fa-bars fa-lg"></i>
                    </td>
                  </tr>
                  
                  <tr class="w3-hide">
                    <td colspan="5" class="w3-padding-64 w3-center w3-text-grey">
                      No hay proyectos coincidentes con la busqueda
                    </td>
                  </tr>
                  
                  <!--fila de ingreso-->
                  <tr class="native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis"><b>Ratones de laboratorio blancos</b></td>
                    <td class="w3-text-grey">GINVE</td>
                    <td class="w3-text-grey">405</td>
                    <td class="w3-text-green"><b>+$100,000,000.00</b></td>
                    <td>
                      <div class="w3-dropdown-click w3-right w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-income-1')">
                          <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <div id="dropdown-income-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
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
                      </div>
                    </td>
                  </tr>
                  
                  <!--agregar ingreso directamente-->
                  <tr class="w3-white native-td-data native-income-td-data">
                    <td class="w3-text-blue native-text-elipsis">
                      <label for="income-concept" class="w3-hide-small w3-hide-medium">Concepto</label>
                      <input type="text" id="income-concept" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="income-expense-category" class="w3-hide-small w3-hide-medium native-text-elipsis">Categoria de gasto</label>
                      <select id="income-expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">GINVE</option>
                        <option value="2">GCORR</option>
                      </select>
                    </td>
                    <td class="w3-text-grey">
                      <label for="income-expense-subcategory" class="w3-hide-small w3-hide-medium native-text-elipsis">subcategoria de gasto</label>
                      <select id="income-expense-subcategory" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="405">405</option>
                        <option value="200">200</option>
                      </select>
                    </td>
                    <td class="w3-text-green">
                      <label for="income-amount" class="w3-hide-small w3-hide-medium">Importe</label>
                      <input type="number" id="income-amount" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td>
                      &nbsp;
                    </td>
                  </tr>
                                    
                  <tr class="w3-white">
                    <td colspan="5" class="w3-padding w3-center">
                      <div class="w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small">
                          Cancelar <i class="fas fa-times fa-x1"></i>
                        </button>
                      </div>
                      
                      <div class="w3-hide-large">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small w3-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small w3-small">
                          Cancelar <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        
        <!--egresos--->
        <div class="w3-card" style="margin-bottom: 20px">
          <!--header egresos-->
          <div class="w3-container w3-padding-16 w3-xlarge w3-flat-pomegranate">
            <i class="fas fa-arrow-up fa-1x"></i> Egresos
          </div>
          
          <div class="w3-container w3-white">
            <div class="w3-row w3-padding-16">
              <div class="w3-col l7 m4 w3-hide-small">
                <!--vacio-->
                &nbsp;
              </div>
              
              <div class="w3-col l5 m8 w3-large w3-hide-small">
                <span class="w3-large w3-text-dark-grey">Total de egresos:</span>
                <span class="w3-text-red">
                  <b>- $100,000,000.00</b>
                  <small> MXN</small>
                </span>
              </div>

              <div class="w3-col s12 w3-center w3-hide-large w3-hide-medium">
                <div class="w3-large w3-text-dark-grey">
                  Total de egresos:
                </div>
                
                <div class="w3-text-red">
                  <b>- $100,000,000.00</b>
                  <small> MXN</small>
                </div>
              </div>
            </div>
            
            <div class="w3-padding-16">
              <!--tabla de egresos-->
              <table>
                <thead>
                  <tr class="w3-metro-dark-red w3-border-bottom w3-border-red w3-large">
                    <th colspan="8" class="w3-container w3-padding-16 w3-left-align">
                      Lista de egresos
                    </th>
                  </tr>

                  <tr class="w3-pale-red w3-border-bottom w3-border-red">
                    <td style="max-width: 120px"><b class="w3-small">Concepto</b></td>
                    <td class="w3-small">Cat. gasto <br> Operación</td>
                    <td class="w3-small">Fec. pedido <br> N° pedido</td>
                    <td class="w3-small">Fec. transferencia <br> N° transferencia</td>
                    <td class="w3-small">N° partida</td>
                    <td class="w3-small">N° factura <br> N° poliza</td>
                    <td><b class="w3-small">Importe (MXN)</b></td>
                    <td>&nbsp;</td>
                  </tr>
                </thead>
                
                <tbody>
                  <tr class="native-outcome-td-data native-td-data">
                    <td class="w3-text-blue native-text-elipsis native-td-overflow"><b>Ratones de laboratorio blancos</b></td>
                    <td class="w3-text-grey">GINVE <br> <small>Reembolso</small></td>
                    <td class="w3-text-grey">22/04/2019 <br> <small>52382384535</small></td>
                    <td class="w3-text-grey">22/04/2019 <br> <small>52382</small></td>
                    <td class="w3-text-grey">52382</td>
                    <td class="w3-text-grey">52382384535 <br> 52382384535</td>
                    <td class="w3-text-red"><b>-$100,000,000.00</b></td>
                    <td>
                      <div class="w3-dropdown-click w3-right w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-outcome-1')">
                          <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <div id="dropdown-outcome-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
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
                      </div>
                    </td>
                  </tr>
                  
                  <!--añadir egreso directamente-->
                  <tr class="w3-white native-outcome-td-data native-td-data">
                    <td class="w3-text-blue native-text-elipsis native-td-overflow">
                      <label for="outcome-concept" class="w3-small w3-hide-small w3-hide-medium">Concepto</label>
                      <input type="text" id="outcome-concept" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="outcome-expense-category" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">Categoria gasto</label>
                      <select id="outcome-expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">GINVE</option>
                        <option value="2">GCORR</option>
                      </select>
                      <br>
                      <label for="outcome-operation" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">Operación</label>
                      <select id="outcome-operation" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">Compra</option>
                        <option value="2">Reembolso</option>
                      </select>
                    </td>
                    <td class="w3-text-grey">
                      <label for="outcome-order-date" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">Fec. pedido</label>
                      <input type="date" id="outcome-order-date" class="w3-input w3-border w3-round-small" required>
                      <br> 
                      <label for="outcome-order-number" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">N° pedido</label>
                      <input type="text" id="outcome-order-number" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="outcome-transfer-date" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">Fec. transferencia</label>
                      <input type="date" id="outcome-order-date" class="w3-input w3-border w3-round-small" required>
                      <br> 
                      <label for="outcome-transfer-number" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">N° transferencia</label>
                      <input type="text" id="outcome-order-number" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="outcome-starting-number" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">N° partida</label>
                      <input type="text" id="outcome-starting-number" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-grey">
                      <label for="outcome-invoice-number" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">N° factura</label>
                      <input type="text" id="outcome-invoice-number" class="w3-input w3-border w3-round-small" required>
                      <br> 
                      <label for="outcome-policy-number" class="w3-small w3-hide-small w3-hide-medium native-text-elipsis">N° poliza</label>
                      <input type="text" id="outcome-policy-number" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td class="w3-text-red">
                      <label for="income-amount" class="w3-small w3-hide-small w3-hide-medium">Importe</label>
                      <input type="number" id="outcome-amount" class="w3-input w3-border w3-round-small" required>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                  
                  <tr class="w3-white">
                    <td colspan="8" class="w3-padding w3-center">
                      <div class="w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir egreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small">
                          Cancelar <i class="fas fa-times fa-x1"></i>
                        </button>
                      </div>
                      
                      <div class="w3-hide-large">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small w3-small">
                          Añadir egreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small w3-small">
                          Cancelar <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <div class="w3-col l1 m1 w3-hide-small">
        <!--vacio-->
        &nbsp;
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