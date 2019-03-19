/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Procesos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author elect
 */
public class DBConexion {
  
  private Connection con;
  
  public DBConexion() {
    String cadena="jdbc:mysql://localhost:3306/PESM";
    try {
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection(cadena,"root","n0m3l0");
    }catch (ClassNotFoundException | SQLException ex) {
      System.out.println(ex.getMessage());
      Logger.getLogger(DBConexion.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
  
  public Connection getConnection(){
    return con;
  }
}
