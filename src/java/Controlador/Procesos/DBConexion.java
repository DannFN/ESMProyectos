package Controlador.Procesos;

import static java.lang.Class.forName;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import static java.util.logging.Level.SEVERE;
import static java.util.logging.Logger.getLogger;

/**
 *
 * @author Daniel Flores
 */
public final class DBConexion {
  
  private static Connection con;
  
  private static final String PARAM = "jdbc:mysql://127.0.0.1:3306/PESM";
  private static final String PARAM1 = "com.mysql.jdbc.Driver";
  private static final String PARAM2 = "root";
  private static final String PARAM3 = "n0m3l0";
  
  public DBConexion() {
    try {
      forName(PARAM1);
      con = DriverManager.getConnection(PARAM, PARAM2, PARAM3);
    }catch (ClassNotFoundException | SQLException e) {
      out.println("Error en la conexión");
      out.println(e.getMessage());
      getLogger(DBConexion.class.getName()).log(SEVERE, null, e);
    }
  }
  
  public Connection getConnection(){
    return con;
  }
}
