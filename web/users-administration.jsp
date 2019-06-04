<%-- 
    Document   : users-administration
    Created on : 26/04/2019, 02:20:20 PM
    Author     : elect
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Administración de usuarios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" type="text/css" href="css/w3/w3.css">
    <link rel="stylesheet" type="text/css" href="css/native/w3-overwrited.css">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/all.css">
    <link rel="stylesheet" type="text/css" href="css/native/responsive-users-tables.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-theme.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-metro-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-flat-colors.css">
    <link rel="stylesheet" type="text/css" href="css/w3/w3-win8-colors.css">
    <script type="text/javascript" src="javascript/additionals/jquery.js"></script>
    <script type="text/javascript" src="javascript/w3/w3.js"></script>
    <script type="text/javascript" src="javascript/native/ajax.js"></script>
    <script type="text/javascript" src="javascript/native/scripts.js"></script>
    <script type="text/javascript" src="javascript/native/validations.js"></script>
    <script>
      window.onscroll = function() { stickyHeader('sticky-header'); };
      window.onclick = function() { closeModalOutside(event, 'modal1'); closeModalOutside(event, 'modal2'); closeModalOutside(event, 'modal3'); };
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
          <input type="text" id="searchbox" class="w3-input w3-round-small w3-theme-d1 w3-border-0 native-input-search" placeholder="&#xf002; &nbsp; Filtrar resultados por nombre de usuario" style="font-family:'Trebuchet MS', 'FontAwesome'">
        </div>

        <div class="w3-col l1 m1 s2 w3-center">
          <button class="w3-button w3-theme-d2 w3-hover-theme w3-round-small w3-hide-small native-button-navbar" onclick="showCloseNavBlock('actions-bar')">
            <i class="fa fa-bars fa-lg"></i>
          </button>

          <button class="w3-button w3-theme-d2 w3-hover-theme w3-round-small w3-hide-large w3-hide-medium native-button-navbar" onclick="showCloseNavBlock('actions-bar'); showCloseNavBlock('actions-bar-mobile')">
            <i class="fa fa-bars fa-lg"></i>
          </button>
        </div>
      </div>

      <!--barra de acciones-->
      <div id="actions-bar" class="w3-bar w3-theme-d3 w3-hide">
        <a href="#add-user-smoth" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showCloseMultipleRows('add-user-form')">
          <i class="fa fa-plus"></i> Añadir usuario
        </a>
        <button class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar" onclick="showModal('modal2')">
          <i class="fa fa-edit"></i> Actualizar mi contraseña
        </button>
        <a href="proyects-administration.jsp" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
          <i class="fa fa-plus"></i> Administrar proyectos
        </a>
        <form action="LogOut" method="post" class="w3-right">
          <button type="submit" class="w3-bar-item w3-button w3-hover-theme w3-hide-small native-button-navbar">
            Salir <i class="fas fa-sign-out-alt"></i>
          </button>
        </form>

        <!--barra de acciones mobile-->
        <div id="actions-bar-mobile" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium">
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal1')">
            <i class="fa fa-plus fa-fw"></i> Añadir usuario
          </button>
          <button class="w3-bar-item w3-button w3-hover-theme native-button-navbar" onclick="showModal('modal2')">
            <i class="fa fa-edit"></i> Actualizar mi contraseña
          </button>
          <a href="proyects-administration.jsp" class="w3-bar-item w3-button w3-hover-theme native-button-navbar">
            <i class="fa fa-plus"></i> Administrar proyectos
          </a>
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
          <span class="w3-hide-small native-banner-text-large">Administración de Usuarios</span> 
          <br>
          <span class="w3-hide-large w3-hide-medium native-banner-text-small">Vista General de Usuarios</span> 
          <br class="w3-hide-large w3-hide-medium">
          Sesión de administrador actual: Nombre de Usuario del Administrador
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
        <!--contenido de los usuarios-->
        <br class="w3-hide-small">
        <table class="w3-card">
          <thead>
            <tr class="w3-metro-dark-blue">
              <th colspan="7" class="w3-container w3-padding-16 w3-large">Lista de Usuarios</th> 
            </tr>

            <tr class="w3-metro-blue">
              <td class="w3-center w3-xlarge">N°</td>
              <td><b>Usuario</b></td>
              <td>Nombre</td>
              <td>Apellido</td>
              <td colspan="3">Nivel de acceso</td>
            </tr>
          </thead>
          
          <tbody id="users-table">
            <!--fila de usuario-->
            <tr class="native-td-data">
              <td class="w3-center w3-hide-medium w3-hide-small"><b>1</b></td>
              <td>
                <input type="text" id="username-1" value="Administrador maestro" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <input type="text" id="user-real-name-1" value="Brenda" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <input type="text" id="user-surname-1" value="Juárez" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <select id="accesslevel-1" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">Administración Proyectos</option>
                  <option value="2">Consulta de Proyectos</option>
                  <option value="1">Administración de proyectos y usuarios</option>
                </select>
              </td>
              <td class="w3-center">
                <button class="w3-button w3-metro-dark-blue w3-hover-blue w3-round-small w3-medium w3-hide-medium w3-hide-small">
                  <i class="fas fa-save fa-fw"></i> Guardar
                </button>
                <div class="w3-hide-large">
                  <button class="w3-button w3-metro-dark-blue w3-round-small w3-small">
                    <i class="fas fa-save fa-fw"></i> Guardar
                  </button>  
                  <button class="w3-button w3-blue w3-round-small w3-small">
                    <i class="fas fa-edit fa-x1"></i> Contraseña
                  </button>
                  <button class="w3-button w3-win8-magenta w3-round-small w3-small">
                    <i class="fas fa-trash-alt fa-x1"></i> Eliminar
                  </button>
                </div>
              </td>
              <td class="w3-center">
                <div class="w3-dropdown-click w3-hide-medium w3-hide-small">
                  <button class="w3-button w3-small w3-round-small" onclick="showCloseNavBlock('dropdown-user-1')"> 
                    <i class="fas fa-ellipsis-h"></i>
                  </button>
                  <div id="dropdown-user-1" class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
                    <div>
                      <input type="number" id="user-edit-1" value="1" hidden readonly required>
                      <button class="w3-bar-item w3-button">
                        <i class="fas fa-edit fa-fw"></i> <span class="w3-small">Editar contraseña</span>
                      </button>
                    </div>
                    <div>
                      <input type="number" id="user-delete-1" value="1" hidden readonly required>
                      <button class="w3-bar-item w3-button">
                        <i class="fas fa-trash-alt fa-fw"></i> Eliminar
                      </button>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            
            <!--añadir usuario directamente-->
            <tr id="add-user-smoth" class="w3-hide add-user-form">
              <td colspan="7" class="w3-center w3-padding-16"><b class="w3-text-purple w3-large">Añadir Usuario</b></td>
            </tr>
            
            <tr class="w3-white w3-hide add-user-form">
              <td colspan="2" >
                <label for="add-user-real-name">Nombre</label>
                <input type="text" id="add-user-real-name" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <label for="add-user-surname">Apellido</label>
                <input type="text" id="add-user-surname" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <label for="add-user-username">Usuario</label>
                <input type="text" id="add-user-username" class="w3-input w3-border w3-round-small" required>
              </td>
              <td>
                <label for="add-user-access-level">Nivel de acceso</label>
                <select id="add-user-access-level" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">Administración Proyectos</option>
                  <option value="2">Consulta de Proyectos</option>
                  <option value="1">Administración de proyectos y usuarios</option>
                </select>
              </td>
              
              <td colspan="2">
                <label for="add-user-password">Contraseña</label>
                <input type="password" id="add-user-password" class="w3-input w3-border w3-round-small" required>
              </td>
            </tr>
            
            <tr class="w3-white w3-hide add-user-form">
              <td colspan="7" class="w3-padding w3-center">
                <div>
                  <button class="w3-button w3-flat-belize-hole w3-hover-blue w3-round-small">
                    Añadir Usuario <i class="fas fa-plus fa-x1"></i>
                  </button>

                  <button class="w3-button w3-flat-pomegranate w3-hover-red w3-round-small" onclick="showCloseMultipleRows('add-user-form')">
                    Cancelar <i class="fas fa-times fa-x1"></i>
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <div class="w3-col l1 m1 w3-hide-small">
        <!--vacio-->
        &nbsp;
      </div>
    </div>
    
    <!--ventana modal 1-->
    <div id="modal1" class="w3-modal">
      <div class="w3-modal-content" style="margin: 16px auto">
        <div class="w3-white">
          <span onclick="closeModal('modal1')" class="w3-button w3-display-topright w3-round-small w3-indigo w3-hover-light-blue" style="margin: 5px"><b>&times;</b></span>
          <div class="w3-container w3-blue">
            <h6>Añadir Usuario</h6>
          </div>
          <div class="w3-container w3-padding-16">
            <div class="w3-row">
              <div class="w3-col l6 w3-padding">
                <label for="add-user-real-name-modal">Nombre</label>
                <input type="text" id="add-user-real-name-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l6 w3-padding">
                <label for="add-user-surname-modal">Apellido</label>
                <input type="text" id="add-user-surname-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l6 w3-padding">
                <label for="add-user-username-modal">Usuario</label>
                <input type="text" id="add-user-username-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l6 w3-padding">
                <label for="add-user-access-level-modal">Nivel de acceso</label>
                <select id="add-user-access-level-modal" class="w3-input w3-border w3-round-small" required>
                  <option disabled hidden value="" selected>Seleccionar</option>
                  <option value="1">Administración Proyectos</option>
                  <option value="2">Consulta de Proyectos</option>
                  <option value="1">Administración de proyectos y usuarios</option>
                </select>
              </div>
            </div>
            
            <div class="w3-row">
              <div class="w3-col l6 w3-padding">
                <label for="add-user-password-modal">Contraseña</label>
                <input type="password" id="add-user-password-modal" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left" onclick="addCProyect()">Añadir</button> 
                <button class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal1')">Cancelar</button>
              </div>
            </div>
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
            <h6>Cambiar Contraseña</h6>
          </div>
          <div id="sip-proyect-edit-container" class="w3-container w3-padding-16">
            <div class="w3-row">
              <div class="w3-col l6 w3-padding">
                <label for="change-user-password">Contraseña actual</label>
                <input type="password" id="change-user-password" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l6 w3-padding">
                <label for="change-user-confirm-password">Nueva contraseña</label>
                <input type="password" id="change-user-confirm-password" class="w3-input w3-border w3-round-small" required>
              </div>
              
              <div class="w3-col l12 w3-padding">
                <button class="w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left" onclick="addCProyect()">Actualizar</button> 
                <button class="w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right" onclick="closeModal('modal2')">Cancelar</button>
              </div>
            </div>
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
