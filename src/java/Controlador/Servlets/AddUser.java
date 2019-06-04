package Controlador.Servlets;

import Controlador.Objetos.User;
import Controlador.Procesos.DBOperations;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel Flores
 */
public class AddUser extends HttpServlet {
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8"); 
    DBOperations dbo = new DBOperations();
    User u;
    
    try(PrintWriter out = response.getWriter()) {
     String userRealName = request.getParameter("user_real_name");
     String userSurname = request.getParameter("user_surname");
     String userUsername = request.getParameter("user_username");
     char userType = request.getParameter("user_access_level").charAt(0);
     String userPassword = request.getParameter("user_password");
     
     u = new User(userType, userUsername, userPassword, userRealName, userSurname);
      
      if(dbo.addUser(u) > 0){
        u = dbo.user(userUsername);
        
        out.println(" <tr id=\"user-container-"+ u.getUserId() + "\" class=\"native-td-data\">\n" +
                    "   <td class=\"w3-center w3-hide-medium w3-hide-small\"><b>" + u.getUserId() + "</b></td>\n" +
                    "   <td>\n" +
                    "     <input type=\"text\" id=\"username-" + u.getUserId() + "\" value=\"" + u.getUserName() + "\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "   </td>\n" +
                    "   <td>\n" +
                    "     <input type=\"text\" id=\"user-real-name-" + u.getUserId() + "\" value=\"" + u.getUserRealName() + "\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "   </td>\n" +
                    "   <td>\n" +
                    "     <input type=\"text\" id=\"user-surname-" + u.getUserId() + "\" value=\"" + u.getUserSurname() + "\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "   </td>\n" +
                    "   <td>\n" +
                    "     <select id=\"accesslevel-" + u.getUserId() + "\" class=\"w3-input w3-border w3-round-small\" required>\n");
        
        switch(u.getUserType()){
          case 'W': {
            out.println("       <option value=\"W\" selected>Administración Proyectos</option>\n" + 
                        "       <option value=\"R\">Consulta de Proyectos</option>\n" + 
                        "       <option value=\"A\">Administración de proyectos y usuarios</option>");
            break;
          }
          case 'R': {
            out.println("       <option value=\"W\">Administración Proyectos</option>\n" + 
                        "       <option value=\"R\" selected>Consulta de Proyectos</option>\n" + 
                        "       <option value=\"A\">Administración de proyectos y usuarios</option>");
            break;
          }
          case 'A': {
            out.println("       <option value=\"W\">Administración Proyectos</option>\n" + 
                        "       <option value=\"R\">Consulta de Proyectos</option>\n" + 
                        "       <option value=\"A\" selected>Administración de proyectos y usuarios</option>");
            break;
          }
        }           
        
        out.println("     </select>\n" +
                    "   </td>\n" +
                    "   <td class=\"w3-center\">\n" +
                    "     <button class=\"w3-button w3-metro-dark-blue w3-hover-blue w3-round-small w3-medium w3-hide-medium w3-hide-small\">\n" +
                    "       <i class=\"fas fa-save fa-fw\"></i> Guardar\n" +
                    "     </button>\n" +
                    "     <div class=\"w3-hide-large\">\n" +
                    "       <button class=\"w3-button w3-metro-dark-blue w3-round-small w3-small\">\n" +
                    "         <i class=\"fas fa-save fa-fw\"></i> Guardar\n" +
                    "       </button>  \n" +
                    "       <button class=\"w3-button w3-blue w3-round-small w3-small\">\n" +
                    "         <i class=\"fas fa-edit fa-x1\"></i> Contraseña\n" +
                    "       </button>\n" +
                    "       <button class=\"w3-button w3-win8-magenta w3-round-small w3-small\">\n" +
                    "         <i class=\"fas fa-trash-alt fa-x1\"></i> Eliminar\n" +
                    "       </button>\n" +
                    "     </div>\n" +
                    "   </td>\n" +
                    "   <td class=\"w3-center\">\n" +
                    "     <div class=\"w3-dropdown-click w3-hide-medium w3-hide-small\">\n" +
                    "       <button class=\"w3-button w3-small w3-round-small\" onclick=\"showCloseNavBlock('dropdown-user-" + u.getUserId() + "')\"> \n" +
                    "         <i class=\"fas fa-ellipsis-h\"></i>\n" +
                    "       </button>\n" +
                    "       <div id=\"dropdown-user-" + u.getUserId() + "\" class=\"w3-dropdown-content w3-bar-block w3-border\" style=\"right:0\">\n" +
                    "         <div>\n" +
                    "           <input type=\"number\" id=\"user-edit-" + u.getUserId() + "\" value=\"" + u.getUserId() + "\" hidden readonly required>\n" +
                    "           <button class=\"w3-bar-item w3-button\">\n" +
                    "             <i class=\"fas fa-edit fa-fw\"></i> <span class=\"w3-small\">Editar contraseña</span>\n" +
                    "           </button>\n" +
                    "         </div>\n" +
                    "         <div>\n" +
                    "           <input type=\"number\" id=\"user-delete-" + u.getUserId() + "\" value=\"" + u.getUserId() + "\" hidden readonly required>\n" +
                    "             <button class=\"w3-bar-item w3-button\">\n" +
                    "               <i class=\"fas fa-trash-alt fa-fw\"></i> Eliminar\n" +
                    "             </button>\n" +
                    "         </div>\n" +
                    "       </div>\n" +
                    "     </div>\n" +
                    "   </td>\n" +
                    " </tr>");
      }else {
        out.println("Internal server error");
      }      
    }finally {
      dbo.closeConnection();
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
