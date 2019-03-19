/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Procesos;

import Controlador.Objetos.Income;
import Controlador.Objetos.Outcome;
import Controlador.Objetos.Proyect;
import Controlador.Objetos.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author elect
 */
public class Operations {
  private Connection con;
  private ArrayList<Proyect> p;
  private ArrayList<Income> i;
  private ArrayList<Outcome> o;
  private User u;

  public Operations() {
    openConnection();
  }
  
  /*Abrir la conexión*/
  public final void openConnection() {
    DBConexion conn = new DBConexion();
    con = conn.getConnection();
  }
  
  /*Cerrar la conexión*/
  public void closeConnection() {
    try{
      con.close();
    }catch(SQLException e) {
      System.out.println("Cierre Fallido");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
  }
  
  /*Obtener todos los proyectos*/
  public ArrayList<Proyect> proyects() {
   try{
      String sql;
      PreparedStatement ps;
      ResultSet rs;
      Proyect pr;
      
      sql = "SELECT * FROM CProyects;";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      p = new ArrayList<>();
      
      if(rs.next()){        
        do{
          pr = new Proyect();
          
          pr.setPoyectNumber(rs.getInt(1));
          pr.setTitular(rs.getString(2));
                    
          p.add(pr);
        }while(rs.next());
      }

    }catch (SQLException e) {
      p = null;
      System.out.println("Registro Fallido");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
   
   return p;
  }
  
  /*Obtener todos los ingresos de un proyecto*/
  public ArrayList<Income> incomes(int idProyecto) {    
    try {
      String sql;
      PreparedStatement ps;
      ResultSet rs;
      Income in;
      
      sql = "SELECT * FROM CIngresos WHERE idProyecto = ?;";
      ps = con.prepareStatement(sql);
      ps.setInt(1, idProyecto);
      rs = ps.executeQuery();
      i = new ArrayList<>();
      
      if(rs.next()){
        do{
          in = new Income();
          
          in.setIncomeId(rs.getInt(1));
          in.setExpenseCategory(rs.getString(3));
          in.setExpenseSubCategory(rs.getString(4));
          in.setConcept(rs.getString(5));
          in.setAmount(rs.getFloat(6));
          
          i.add(in);
        }while(rs.next());
      }
      
    }catch(SQLException e) {
      i = null;
      System.out.println("Registro Fallido");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return i;
  }
}
