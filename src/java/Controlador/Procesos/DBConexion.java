package Controlador.Procesos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
      Class.forName(PARAM1);
      con = DriverManager.getConnection(PARAM, PARAM2, PARAM3);
    }catch (ClassNotFoundException | SQLException e) {
      System.out.println("Error en la conexión");
      System.out.println(e.getMessage());
      Logger.getLogger(DBConexion.class.getName()).log(Level.SEVERE, null, e);
    }
  }
  
  public Connection getConnection(){
    return con;
  }
}
