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
 * @author Daniel Flores
 */
public class AddCProyect extends HttpServlet {

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
    
    try(PrintWriter out = response.getWriter()) {
      int proyectNumber = parseInt(request.getParameter("conacyt_proyect_number"));
      String proyectName = request.getParameter("conacyt_proyect_name");
      String proyectTitular = request.getParameter("conacyt_proyect_titular");
      
      p = new ConacytProyect(proyectNumber, proyectName, proyectTitular, 0, null, null);
      
      if(dbo.addConacytProyect(p) > 0) {
        p = dbo.conacytProyect(proyectNumber);
        
        out.println("<tr id=\"conacyt-proyect-container-"+ p.getProyectNumber() + "\" class=\"native-td-data\">\n" +
                    "  <td class=\"w3-center w3-hide-medium w3-hide-small\">\n" +
                    "    <b id=\"conacyt-proyect-number-"+ p.getProyectNumber() + "\">"+ p.getProyectNumber() + "</b>\n" +
                    "  </td>\n" +
                    "  <td class=\"native-text-elipsis\">\n" +
                    "    <b id=\"conacyt-proyect-name-"+ p.getProyectNumber() + "\" class=\"w3-text-blue\">"+ p.getProyectName() + "</b>\n" +
                    "    <br>\n" +
                    "    <small class=\"w3-hide-small w3-hide-medium conacyt-proyect-titular-"+ p.getProyectNumber() + "\">"+ p.getTitular() + "</small>\n" +
                    "  </td>\n" +
                    "  <td class=\"w3-hide-large native-text-elipsis\">\n" +
                    "    <span class=\"conacyt-proyect-titular-"+ p.getProyectNumber() + "\">"+ p.getTitular() + "</span>\n" +
                    "  </td>\n" +
                    "  <td>\n" +
                    "    <b id=\"conacyt-proyect-balance-"+ p.getProyectNumber() + "\" class=\"w3-text-green\">$"+ p.getBalance() + " MXN</b>\n" +
                    "  </td>\n" +
                    "  <td>\n" +
                    "    <div class=\"w3-dropdown-click w3-right w3-hide-medium w3-hide-small\">\n" +
                    "      <button class=\"w3-button w3-small w3-round-small\" onclick=\"showCloseNavBlock('dropdown-cproyect-"+ p.getProyectNumber() + "')\"> \n" +
                    "        <i class=\"fas fa-ellipsis-h\"></i>\n" +
                    "      </button>\n" +
                    "      <div id=\"dropdown-cproyect-"+ p.getProyectNumber() + "\" class=\"w3-dropdown-content w3-bar-block w3-border\" style=\"right:0\">\n" +
                    "        <form action=\"conacyt-proyect-details.jsp\" method=\"get\">\n" +
                    "          <input type=\"number\" name=\"proyect-number\" value=\""+ p.getProyectNumber() + "\" hidden readonly required>\n" +
                    "          <button type=\"submit\" class=\"w3-bar-item w3-button\">\n" +
                    "            Detalles <i class=\"fas fa-arrow-right fa-fw w3-right\"></i>\n" +
                    "          </button>\n" +
                    "        </form>\n" +
                    "        <div>\n" +
                    "          <input type=\"number\" id=\"conacyt-proyect-number-edit-"+ p.getProyectNumber() + "\" value=\""+ p.getProyectNumber() + "\" hidden readonly required>\n" +
                    "          <button class=\"w3-bar-item w3-button\" onclick=\"showModal('modal3'); editCProyectGet('conacyt-proyect-number-edit-"+ p.getProyectNumber() + "');\">\n" +
                    "            <i class=\"fas fa-trash-alt fa-fw\"></i> Editar \n" +
                    "          </button>\n" +
                    "        </div>\n" +
                    "        <div>\n" +
                    "          <input type=\"number\" id=\"conacyt-proyect-number-delete-"+ p.getProyectNumber() + "\" value=\""+ p.getProyectNumber() + "\" hidden readonly required>\n" +
                    "          <button class=\"w3-bar-item w3-button\" onclick=\"deleteCProyect('conacyt-proyect-number-delete-"+ p.getProyectNumber() + "')\">\n" +
                    "            <i class=\"fas fa-edit fa-fw\"></i> Eliminar\n" +
                    "          </button>\n" +
                    "        </div>\n" +
                    "      </div>\n" +
                    "    </div>\n" +
                    "    <div class=\"w3-center w3-hide-large\">\n" +
                    "      <button class=\"w3-button w3-blue w3-round-small w3-small\" onclick=\"showModal('modal3'); editCProyectGet('conacyt-proyect-number-edit-"+ p.getProyectNumber() + "');\">\n" +
                    "        <i class=\"fas fa-trash-alt fa-x1\"></i> Editar\n" +
                    "      </button>\n" +
                    "      <button class=\"w3-button w3-win8-magenta w3-round-small w3-small\" onclick=\"deleteCProyect('conacyt-proyect-number-delete-"+ p.getProyectNumber() + "')\">\n" +
                    "        <i class=\"fas fa-edit fa-x1\"></i> Eliminar\n" +
                    "      </button>\n" +
                    "      <form action=\"conacyt-proyect-details.jsp\" method=\"get\" style=\"display: inline-block\">\n" +
                    "        <input type=\"number\" name=\"proyect-number\" value=\""+ p.getProyectNumber() + "\" hidden readonly required>\n" +
                    "        <button type=\"submit\" class=\"w3-button w3-black w3-round-small w3-small\">\n" +
                    "          Detalles <i class=\"fas fa-arrow-right\"></i>\n" +
                    "        </button>\n" +
                    "      </form>\n" +
                    "    </div>\n" +
                    "  </td>\n" +
                    "</tr>");
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
