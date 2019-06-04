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
    int cpn = Integer.parseInt(request.getParameter("conacyt-proyect-number"));
    p = dbo.conacytProyect(cpn);
    dbo.closeConnection();
  }*/ 
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Detalles del proyecto</title>
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
        
        <a href="#add-income-smoth" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showCloseMultipleRows('add-income-form')">
          <i class="fa fa-plus"></i> Añadir ingreso
        </a>
        
        <a href="#add-outcome-smoth" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showCloseMultipleRows('add-outcome-form')">
          <i class="fa fa-plus"></i> Añadir egreso
        </a>
        
        <form action="LogOut" method="post" class="w3-right">
          <button type="submit" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
            Salir <i class="fas fa-sign-out-alt"></i>
          </button>
        </form>
        
        <!--barra de acciones mobile-->
        <div id="actions-bar-mobile" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium">
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal3')">
            <i class="far fa-edit fa-fw"></i> Editar datos del proyecto
          </button>
          
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal1')">
            <i class="fa fa-plus fa-fw"></i> Añadir ingreso
          </button>

          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal2')">
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
      <div id="error-handler" class="w3-bar w3-container w3-padding w3-win8-magenta w3-hide">
        <span class="w3-bar-item">No se pudo procesar la solicitud, vuelve a intentarlo más tarde</span>
        <button class="w3-bar-item w3-button w3-hover-red w3-round-small w3-right" onclick="showCloseNavBlock('error-handler')"><i class="fas fa-times"></i></button>
      </div>

      <!--manejador de éxito-->
      <div id="success-handler" class="w3-bar w3-container w3-padding w3-flat-emerald w3-hide">
        <span class="w3-bar-item">Operación exitosa</span>
        <button class="w3-bar-item w3-button w3-hover-green w3-round-small w3-right" onclick="showCloseNavBlock('success-handler')"><i class="fas fa-times"></i></button>
      </div>
    </div>
    
    <!--banner-->
    <div class="w3-center native-banner-background">
      <div class="w3-container w3-text-white native-banner native-inset-shadow">
        <div class="w3-container w3-padding-32 w3-text-white native-banner">
          <span class="w3-hide-small native-banner-text-large">Proyecto N°: Nombre del Proyecto</span> 
          <span class="w3-hide-large w3-hide-medium native-banner-text-small">Proyecto N°: Nombre del Proyecto</span> 
          <br>
          Titular: Titular del proyecto
        </div>
      </div>
      <div class="w3-theme">
        <div class="w3-row-padding w3-container w3-padding-16">
          <div class="w3-col l4 m4">
            <strong>
              <small>Total de ingresos</small>
              <br>
              <i class="fas fa-arrow-down w3-large w3-text-green"></i> <i class="fas fa-plus w3-small w3-text-green"></i> $100,000,000.00
            </strong>
          </div>
          <div class="w3-col l4 m4">
            <strong>
              <small>Total de egresos</small>
              <br>
              <i class="fas fa-arrow-up w3-large w3-text-red"></i> <i class="fas fa-minus w3-small w3-text-green"></i> $100,000,000.00
            </strong>
          </div>
          <div class="w3-col l4 m4">
            <strong>
              <small>Saldo restante</small>
              <br>
              <i class="fas fa-hand-holding-usd w3-large"></i> $100,000,000.00
            </strong>
          </div>
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

        <!--contenido de los ingresos de un proyecto conacyt--->
        <div class="w3-card" style="margin-bottom: 20px">
          <!--header ingresos-->
          <div class="w3-container w3-padding-16 w3-xlarge w3-green">
            <i class="fas fa-arrow-down fa-1x"></i> Ingresos
          </div>

          <!--contenedor ingresos-->
          <div class="w3-container w3-white w3-padding-32">
            <div>
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
                  <!--sin ingresos-->
                  <tr class="w3-hide"><!--TODO retirar hide-->
                    <td colspan="5" class="w3-center w3-text-grey w3-padding-64">
                      No hay ingresos que mostrar, No hay ingresos que mostrar, comienza añadiendo uno haciendo click sobre el botón &nbsp;
                      <i class="fa fa-bars fa-lg"></i>
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
                          <button class="w3-bar-item w3-button">
                            <i class="fas fa-trash-alt fa-fw"></i> Editar
                          </button>
                          <button class="w3-bar-item w3-button">
                            <i class="fas fa-edit fa-fw"></i> Eliminar
                          </button>
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
                  
                  <!--resultados no encontrados-->
                  <tr class="w3-hide not-found-tr">
                    <td colspan="5" class="w3-padding-64 w3-center w3-text-grey">
                      No hay ingresos coincidentes con la busqueda
                    </td>
                  </tr>
                  
                  <!--agregar ingreso directamente-->
                  <tr id="add-income-smoth" class="w3-hide add-income-form">
                    <td colspan="5" class="w3-center w3-padding-16"><b class="w3-text-purple w3-large">Añadir Ingreso</b></td>
                  </tr>
                  
                  <tr class="w3-white w3-hide native-td-data native-income-td-data add-income-form">
                    <td>
                      <label for="income-administration" class="w3-hide-small w3-hide-medium native-text-elipsis">Administración</label>
                      <select id="administration" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="1">Primera administación</option>
                        <option value="2">Segunda administración</option>
                        <option value="3">Tercera administración</option>
                      </select>
                    </td>
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
                      <select id="income-expense-category" class="w3-input w3-border w3-round-small" required>
                        <option disabled hidden value="" selected>Seleccionar</option>
                        <option value="405">405</option>
                        <option value="200">200</option>
                      </select>
                    </td>
                    <td class="w3-text-green">
                      <label for="income-amount" class="w3-hide-small w3-hide-medium">Importe</label>
                      <input type="number" id="income-amount" class="w3-input w3-border w3-round-small" required>
                    </td>
                  </tr>
                                    
                  <tr class="w3-white w3-hide add-income-form">
                    <td colspan="5" class="w3-padding w3-center">
                      <div>
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir Ingreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small" onclick="showCloseMultipleRows('add-income-form')">
                          Cancelar <i class="fas fa-times fa-x1"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        
        <!--contenido de los egresos de un proyecto conacyt--->
        <div class="w3-card" style="margin-bottom: 20px">
          <!--header egresos-->
          <div class="w3-container w3-padding-16 w3-xlarge w3-flat-pomegranate">
            <i class="fas fa-arrow-up fa-1x"></i> Egresos
          </div>
          
          <!--contenedor egresos-->
          <div class="w3-container w3-white w3-padding-32">            
            <div>
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
                  <!--sin egresos-->
                  <tr class="w3-hide"><!--TODO retirar hide-->
                    <td colspan="5" class="w3-center w3-text-grey w3-padding-64">
                      No hay egresos que mostrar, comienza añadiendo uno haciendo click sobre el botón &nbsp;
                      <i class="fa fa-bars fa-lg"></i>
                    </td>
                  </tr>
                  
                  <!--fila de ingreso-->
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
                          <button class="w3-bar-item w3-button">
                            <i class="fas fa-trash-alt fa-fw"></i> Editar
                          </button>
                          <button class="w3-bar-item w3-button">
                            <i class="fas fa-edit fa-fw"></i> Eliminar
                          </button>
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
                  
                  <!--resultados no encontrados-->
                  <tr class="w3-hide not-found-tr">
                    <td colspan="5" class="w3-padding-64 w3-center w3-text-grey">
                      No hay egresos coincidentes con la busqueda
                    </td>
                  </tr>
                  
                  <!--añadir egreso directamente-->
                  <tr id="add-outcome-smoth" class="w3-hide add-outcome-form">
                    <td colspan="8" class="w3-center w3-padding-16"><b class="w3-text-purple w3-large">Añadir Egreso</b></td>
                  </tr>
                  
                  <tr class="w3-white w3-hide native-outcome-td-data native-td-data add-outcome-form">
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
                  
                  <tr class="w3-white w3-hide add-outcome-form">
                    <td colspan="8" class="w3-padding w3-center">
                      <div class="w3-hide-medium w3-hide-small">
                        <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                          Añadir egreso <i class="fas fa-plus fa-x1"></i>
                        </button>

                        <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small" onclick="showCloseMultipleRows('add-outcome-form')">
                          Cancelar <i class="fas fa-times fa-x1"></i>
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
    
    <!--modal 1-->
    <div id="modal1" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal1')" class="w3-button w3-display-topright w3-round-small w3-metro-dark-green w3-hover-light-green" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-green">
            <h6>Añadir ingreso</h6>
          </div>
          <div id="conacyt-add-income-container" class="w3-padding-16">            
            <div class="w3-row">
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-administration-modal" class="w3-text-grey">Administración</label>
                <select id="conacyt-add-income-administration-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">Primera administación</option>
                  <option value="2">Segunda administración</option>
                  <option value="3">Tercera administración</option>
                </select>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-concept-modal" class="w3-text-grey">Concepto</label>
                <input type="text" id="conacyt-add-income-concept-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-expense-category-modal" class="w3-text-grey">Categoria de gasto</label>
                <select id="conacyt-add-income-expense-category-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">GINVE</option>
                  <option value="2">GCORR</option>
                </select>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-expense-subcategory-modal" class="w3-text-grey">Subcategoria de gasto</label>
                <select id="conacyt-add-income-expense-subcategory-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="405">405</option>
                  <option value="200">200</option>
                </select>
              </div>              
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-amount-modal" class="w3-text-grey">Importe</label>
                <input type="number" id="conacyt-add-income-amount-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left">Añadir</button> 
                <button class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal1')">Cancelar</button>
              </div>
            </div>            
          </div>
        </div>
      </div>
    </div>
    
    <!--modal 2-->
    <div id="modal2" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal2')" class="w3-button w3-display-topright w3-round-small w3-flat-pomegranate w3-hover-red" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-metro-dark-red">
            <h6>Añadir egreso</h6>
          </div>
          <div id="sip-proyect-edit-container" class="w3-padding-16">            
            <div class="w3-row">
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-concept-modal" class="w3-text-grey">Concepto</label>
                <input type="text" id="conacyt-outcome-concept-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-expense-category-modal" class="w3-text-grey">Categoria de gasto</label>
                <select id="conacyt-outcome-expense-category-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">GINVE</option>
                  <option value="2">GCORR</option>
                </select>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-operation-type-modal" class="w3-text-grey">Tipo de operación</label>
                <select id="conacyt-outcome-operation-type-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">Compra</option>
                  <option value="2">Reembolso</option>
                </select>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-order-date-modal" class="w3-text-grey">Fecha de pedido</label>
                <input type="date" id="conacyt-outcome-order-date-modal" class="w3-input w3-border w3-round-small" required>
              </div>              
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-order-number-modal" class="w3-text-grey">Número de pedido</label>
                <input type="text" id="conacyt-outcome-order-number-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-transfer-date-modal" class="w3-text-grey">Fecha de trasferecia</label>
                <input type="date" id="conacyt-outcome-transfer-date-modal" class="w3-input w3-border w3-round-small" required>
              </div>   
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-transfer-number-modal" class="w3-text-grey">Número de transferencia</label>
                <input type="text" id="conacyt-outcome-transfer-number-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-starting-number-modal" class="w3-text-grey">Número de partida</label>
                <input type="text" id="conacyt-outcome-starting-number-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-invoice-number-modal" class="w3-text-grey">Número de factura</label>
                <input type="text" id="conacyt-outcome-invoice-number-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-outcome-policy-number-modal" class="w3-text-grey">Número de poliza</label>
                <input type="text" id="conacyt-outcome-policy-number-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col w3-padding">
                <label for="conacyt-add-income-amount-modal" class="w3-text-grey">Importe</label>
                <input type="number" id="conacyt-add-income-amount-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left">Añadir</button> 
                <button class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal2')">Cancelar</button>
              </div>
            </div>            
          </div>
        </div>
      </div>
    </div>
    
    <!--modal 3-->
    <div id="modal3" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal3')" class="w3-button w3-display-topright w3-round-small w3-theme-d2 w3-hover-theme" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-theme">
            <h6>Editar información</h6>
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