package Controlador.Servlets;

import Controlador.Objetos.ConacytProyect;
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
public class EditCProyectGet extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {    
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8"); 
    DBOperations dbo = new DBOperations();
    ConacytProyect p;
    
    try (PrintWriter out = response.getWriter()) {
      int proyectNumber = parseInt(request.getParameter("conacyt_proyect_number"));
      p = dbo.conacytProyect(proyectNumber);
      
      if(p != null){
        out.println("<div class=\"w3-row\">\n" +
                    "   <div class=\"w3-col l4 w3-padding\">\n" +
                    "     <label for=\"edit-conacyt-proyect-number\">Número de Proyecto</label>\n" +
                    "     <input type=\"number\" value=\"" + p.getProyectNumber() + "\" id=\"edit-conacyt-proyect-number\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "     <input type=\"number\" value=\"" + p.getProyectNumber() + "\" id=\"edit-conacyt-proyect-old-number\" hidden readonly required>\n" +
                    "   </div>\n" +
                    "   <div class=\"w3-col l8 w3-padding\">\n" +
                    "     <label for=\"edit-conacyt-proyect-name\">Nombre del proyecto</label>\n" +
                    "     <input type=\"text\" value=\"" + p.getProyectName() + "\" id=\"edit-conacyt-proyect-name\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "   </div>\n" +
                    "   <div class=\"w3-col l12 w3-padding\">\n" +
                    "     <label for=\"edit-conacyt-proyect-titular\">Titular del proyecto</label>\n" +
                    "     <input type=\"text\" value=\"" + p.getTitular() + "\" id=\"edit-conacyt-proyect-titular\" class=\"w3-input w3-border w3-round-small\" required>\n" +
                    "   </div>\n" +
                    "   <div class=\"w3-col l12 w3-padding\">\n" +
                    "     <button class=\"w3-button w3-flat-green-sea w3-hover-green w3-round-small w3-left\" onclick=\"editCProyectDo('conacyt-proyect-number-" + p.getProyectNumber() + "', 'conacyt-proyect-name-" + p.getProyectName() + "', 'conacyt-proyect-titular-" + p.getTitular() + "')\">Guardar</button> \n" +
                    "     <button class=\"w3-button w3-metro-dark-red w3-hover-red w3-round-small w3-right\" onclick=\"closeModal('modal3')\">Cancelar</button>\n" +
                    "   </div>\n" +
                    "</div>");
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
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
