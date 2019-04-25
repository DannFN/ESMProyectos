package Controlador.Servlets;

import Controlador.Objetos.ConacytProyect;
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
public class AddProyect extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8"); 
    DBOperations dbo = new DBOperations();
    
    try(PrintWriter out = response.getWriter()) {
      
      int param = Integer.parseInt(request.getParameter("parameter"));
      String param1 = request.getParameter("parameter1");
      String param2 = request.getParameter("parameter2");
      
      ConacytProyect p = new ConacytProyect(param, param1, param2, 0, null, null);
      
      if(dbo.addConacytProyect(p) > 0) {
        /*TODO meter html*/
      }else {
        out.println("Internal server error");
      }      
    }finally {
      dbo.closeConnection();
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
