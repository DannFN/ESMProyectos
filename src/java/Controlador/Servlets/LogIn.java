package Controlador.Servlets;

import Controlador.Objetos.User;
import Controlador.Procesos.DBOperations;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Daniel Flores
 */
public class LogIn extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8"); 
    DBOperations dbo = new DBOperations();
      
    try {
      HttpSession sess;
      RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
      
      String param = request.getParameter("user");
      String param1 = request.getParameter("password");

      switch(dbo.login(param, param1)){
        case 0: {
          request.setAttribute("msg", "Hubo un problema con el servidor intentalo más tarde");
          rd.forward(request, response);
          break;
        }

        case -50: {
          request.setAttribute("msg", "No existe ninguna cuenta asociada al usuario");
          rd.forward(request, response);
          break;
        }

        case -40: {
          request.setAttribute("msg", "La contraseña ingresada es incorrecta");
          rd.forward(request, response);
          break;
        }

        case 10: {
          User u = dbo.user(param);
          sess = request.getSession(true);
          
          sess.setAttribute("user", u);
          response.sendRedirect("proyects-read.jsp");
          break;
        }

        case 20: {
          User u = dbo.user(param);
          sess = request.getSession(true);
          
          sess.setAttribute("user", u);
          response.sendRedirect("proyects-admin.jsp");
          break;
        }

        case 30: {
          User u = dbo.user(param);
          sess = request.getSession(true);
          
          sess.setAttribute("user", u);
          response.sendRedirect("users-admin.jsp");
          break;
        }
      }
    }catch(IOException | ServletException e) {
      System.out.println("Error");
      System.out.println(e.getMessage());
      Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, e);
    }finally {
      dbo.closeConnection();
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
