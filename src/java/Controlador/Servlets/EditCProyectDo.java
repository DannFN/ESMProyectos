package Controlador.Servlets;

import Controlador.Objetos.ConacytProyect;
import Controlador.Procesos.DBOperations;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author elect
 */
public class EditCProyectDo extends HttpServlet {

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
    ConacytProyect p;
    
    try (PrintWriter out = response.getWriter()) {
      int proyectNumber = parseInt(request.getParameter("conacyt_proyect_number"));
      int oldProyectNumer = parseInt(request.getParameter("conacyt_old_proyect_number"));
      String proyectName = request.getParameter("conacyt_proyect_name");
      String proyectTitular = request.getParameter("conacyt_proyect_titular");
      
      p = new ConacytProyect(proyectNumber, proyectName, proyectTitular, 0, null, null);
      
      if(dbo.updateConacytProyect(oldProyectNumer, p) > 0){
        out.println("Success");
      }else {
        out.println("");
      }
      
      out.println("<!DOCTYPE html>");
    
    }finally {
      dbo.closeConnection();
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
