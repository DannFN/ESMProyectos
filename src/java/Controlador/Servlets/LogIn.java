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
    DBOperations dbo;
    HttpSession sess;
    RequestDispatcher rd;
      
    try {
      dbo = new DBOperations();
      sess = request.getSession(true);

      String param = request.getParameter("user");
      String param1 = request.getParameter("password");

      switch(dbo.login(param, param1)){
        case 0: {
          dbo.closeConnection();
          request.setAttribute("msg", "Hubo un problema con el servidor intentalo más tarde");
          rd = request.getRequestDispatcher("index.jsp");
          rd.forward(request, response);
          break;
        }

        case -50: {
          dbo.closeConnection();
          request.setAttribute("msg", "No existe ninguna cuenta asociada al usuario");
          rd = request.getRequestDispatcher("index.jsp");
          rd.forward(request, response);
          return;
        }

        case -40: {
          dbo.closeConnection();
          request.setAttribute("msg", "La contraseña ingresada es incorrecta");
          rd = request.getRequestDispatcher("index.jsp");
          rd.forward(request, response);
          return;
        }

        case 10: {
          User u = dbo.user(param);
          dbo.closeConnection();

          sess.setAttribute("user", u);
          response.sendRedirect("lectura-proyectos.jsp");
          break;
        }

        case 20: {
          User u = dbo.user(param);
          dbo.closeConnection();

          sess.setAttribute("user", u);
          response.sendRedirect("administracion-proyectos.jsp");
          break;
        }

        case 30: {
          User u = dbo.user(param);
          dbo.closeConnection();

          sess.setAttribute("user", u);
          response.sendRedirect("administracion-usuarios.jsp");
          break;
        }
      }
    }catch(IOException | ServletException e) {
      System.out.println("Error");
      System.out.println(e.getMessage());
      Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, e);
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
