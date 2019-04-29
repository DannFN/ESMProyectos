package Controlador.Servlets;

import Controlador.Procesos.DBOperations;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author elect
 */
public class DeleteCProyect extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
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
    
    try(PrintWriter out = response.getWriter()) {
      int proyectNumber = parseInt(request.getParameter("conacyt_proyect_number"));
     
      if(dbo.deleteConacytProyect(proyectNumber) > 0) {
        out.println("Success");
      } else {
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
