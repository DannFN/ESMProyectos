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
  /*variables de asignación de resultados*/
  private ArrayList<Proyect> p;
  private ArrayList<Income> i;
  private ArrayList<Outcome> o;
  private User u;
  
  /*variables de operaciones con la base de datos*/
  private String sql;
  private PreparedStatement ps;
  private ResultSet rs;

  /*constructor que abre la conexión*/
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
        
        System.out.println("Consulta de Proyectos Exitosa");
      }else {
        System.out.println("Consulta de Proyectos Exitosa");
        System.out.println("No hay Proyectos Que Mostrar");
      }

    }catch (SQLException e) {
      p = null;
      System.out.println("Consulta de Proyectos Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
   
   return p;
  }
  
  /*Obtener todos los ingresos de un proyecto*/
  public ArrayList<Income> incomes(Proyect proyect) {    
    try {
      Income in;
      
      sql = "SELECT * FROM CIncomes WHERE ProyectId = ?;";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyect.getProyectNumber());
      rs = ps.executeQuery();
      i = new ArrayList<>();
      
      if(rs.next()) {
        do {
          in = new Income();
          
          in.setIncomeId(rs.getInt(1));
          in.setExpenseCategory(rs.getString(3));
          in.setExpenseSubCategory(rs.getString(4));
          in.setConcept(rs.getString(5));
          in.setAmount(rs.getFloat(6));
          
          i.add(in);
        }while(rs.next());
        
        System.out.println("Consulta de Ingresos del proyecto" + proyectId + "Exitosa");
      }else {
        System.out.println("Consulta de Ingresos del proyecto" + proyectId + "Exitosa");
        System.out.println("No hay Ingresos Que Mostrar");
      }
      
    }catch(SQLException e) {
      i = null;
      System.out.println("Consulta de Ingresos del Proyecto" + proyectId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return i;
  }
  
  public ArrayList<Outcome> outcomes(Proyect proyect){
    try {
      Outcome ou;
      
      sql = "SELECT * FROM COutcomes WHERE ProyectId = ?;";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyect.getProyectNumber());
      rs = ps.executeQuery();
      o = new ArrayList<>();
      
      if(rs.next()) {
        do {
          ou = new Outcome();
          
          ou.setOutcomeId(rs.getInt(1));
          ou.setOrderDate(rs.getString(2));
          ou.setStartingNumber(rs.getInt(3));
          ou.setExpenseCategory(rs.getString(4));
          ou.setConcept(rs.getstring(5));
          ou.setAmount(rs.getFloat(6));
          ou.setInvoiceNumber(rs.getString(7));
          ou.setTransferNumber(rs.getString(8));
          ou.setPolicyNumber(rs.getString(9));
          ou.setTransferDate(rs.getString(10));
          
          o.add(ou);
          System.out.println("");
        }while(rs.next());
        
        System.out.println("Consulta de Egresos del proyecto" + proyectId + "Exitosa");
      }else {
        System.out.println("Consulta de Egresos del proyecto" + proyectId + "Exitosa");
        System.out.println("No hay Egresos Que Mostrar");
      }
      
    }catch(SQLException e) {
      o = null;
      System.out.println("Consulta de Egresos del Proyecto" + proyectId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, e);
    }
  
    return o;
  }
}
