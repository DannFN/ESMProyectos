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
 * @author Daniel Flores
 */
public class DBOperations {
  /*variable de conexión*/
  private Connection con;
  
  /*variables de asignación de resultados*/
  private ArrayList<Proyect> p;
  private ArrayList<Income> i;
  private ArrayList<Outcome> o;
  private ArrayList<User> u;
  private int status;
  
  /*variables de operaciones con la base de datos*/
  private String sql;
  private PreparedStatement ps;
  private ResultSet rs;

  /*constructor que abre la conexión*/
  public DBOperations() {
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
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
  }
  
  /*Operaciones de usuario/sesion*/
  /*Obtener datos del usuario/sesión*/
  public int login(String user, String pass) {
    status = 0;
    
    try {
      String temp;
      
      temp = Security.hash(pass);
      
      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, user);
      rs = ps.executeQuery();
      
      if(!rs.next()){
        status = -50; /*El usuario no existe*/
      }else {
        if(!rs.getString(2).equals(temp)) {
          status = -40; /*Las contraseñas son diferentes*/
        }else
        if(rs.getString(2).equals(temp) && rs.getString(1).equals("R")){
          status = 10; /*El usuario tiene permiso de lectura*/
        }else
        if(rs.getString(2).equals(temp) && rs.getString(1).equals("W")) {
          status = 20; /*El usuario tiene permiso de lectura/escritura*/
        }else
        if(rs.getString(2).equals(temp) && rs.getString(1).equals("A")) {
          status = 30; /*El usuario tiene permiso de administrador (usuario maestro)*/
        }
      }
      
      if(status > 0){
        System.out.println("Consulta de Datos de Usuario Exitosa");
      }else {
        System.out.println("Consulta de Datos de Usuario Exitosa");
        System.out.println("No Hay Registros Asociados al Usuario");
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Obtner datos de usuario para sesion*/
  public User user(String user){
    User us = new User();
    
    try {
      sql = "CALL getUserData(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, user);
      rs = ps.executeQuery();

      if(rs.next()){
        do{
          us.setUserId(rs.getInt(1));
          us.setUserType(rs.getString(2).charAt(0));
          us.setUserName(rs.getString(3));
        }while(rs.next());
        
        System.out.println("Consulta de Datos de Usuario Exitosa");
      }else {
        System.out.println("Consulta de Datos de Usuario Fallida");
        System.out.println("No Hay registros asociados al usuario");
      }
            
    }catch(SQLException e) {
      us = null;
      System.out.println("Consulta de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return us;
  }
  
  /*TODO obtener todos los usuarios*/
  public ArrayList<User> users() {
    u = new ArrayList<>();
    
    try {
      User us;
      
      sql = "CALL getUsers();";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      
      if(rs.next()){
        do {
          us = new User();
          
          us.setUserId(rs.getInt(1));
          us.setUserType(rs.getString(2).charAt(0));
          us.setUserName(rs.getString(3));
          
          u.add(us);
        }while(rs.next());
      }else {
        System.out.println("No Hay Usuarios Adicionales");
      }
      
    }catch(SQLException e) {
      System.out.println("Consulta de Usuarios Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return u;
  }
  
  /*Cambiar contraseña de usuarios generales*/
  public int changeGUPass(String newPass, User user) {
    status = 0;
    
    try{
      String temp = Security.hash(newPass);
      String temp1 = Security.hash(user.getUserPass());
         
      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, user.getUserName());
      rs = ps.executeQuery();
      
      if(!rs.next()){
        status = -50; /*El usuario no existe*/
      }else {
        if(!rs.getString(2).equals(temp1)) {
          status = -40; /*Las contraseñas para comprobación son diferentes*/
        }else {
          sql = "CALL updatePass(?, ?);";
          ps = con.prepareStatement(sql);
          ps.setInt(1, user.getUserId());
          ps.setString(2, temp);

          status = ps.executeUpdate();
        }
      }
      
      if(status > 0){
        System.out.println("Actualización de Datos de Usuario Exitosa");        
      }else {
        System.out.println("Actualización de Datos de Usuario Fallida");
        System.out.println("No hay Registros Asociados al Usuario");
      }
    }catch(SQLException e){
      System.out.println("Actualización de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*TODO Cambiar contraseña de usuario maestro*/
  public int changeMUPass(String newPass, User user) {
    status = 0;
    
    return status;
  }
  
  /*Cambiar nombre de usuario*/
  public int changeUserName(String newUserName, User user)  {
    status = 0;
    
    try{
      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, user.getUserName());
      rs = ps.executeQuery();
      
      if(!rs.next()){
        status = -50; /*El usuario no existe*/
      }else {
        sql = "CALL logIn(?);";
        ps = con.prepareStatement(sql);
        ps.setString(2, newUserName);
        rs = ps.executeQuery();
        
        if(rs.next()) {
          status = -60; /*Ya existen registros asociados al "nuevo" nombre de usuario*/
        }else {
          sql = "CALL updateUserName(?, ?);";
          ps = con.prepareStatement(sql);
          ps.setInt(1, user.getUserId());
          ps.setString(2, newUserName);
          
          status = ps.executeUpdate();
        }
      }
      
      if(status > 0){
        System.out.println("Actualización de Datos de Usuario Exitosa");        
      }else {
        System.out.println("Actualización de Datos de Usuario Fallida");
        System.out.println("No hay Registros Asociados al Usuario");
      }
    }catch(SQLException e){
      System.out.println("Actualización de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Añadir usuarios*/
  public int addUser(User newUser){
    status = 0;
    
    try{
      String temp = Security.hash(newUser.getUserPass());
      
      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, newUser.getUserName());
      rs = ps.executeQuery();
      
      if(rs.next()){
        status = -60; /*Ya existen registros asociados al "nuevo" usuario*/
      }else {
        sql = "CALL addUser(?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, String.valueOf(newUser.getUserType()));
        ps.setString(2, newUser.getUserName());
        ps.setString(3, temp);
        
        rs = ps.executeQuery();
      }
      
      if(status > 0){
        System.out.println("Adición de Nuevo Usuario Exitosa");        
      }else {
        System.out.println("Adición de Nuevo Usuario Fallida");
        System.out.println("Ya Existen Registros Asociados al Usuario");
      }
    }catch(SQLException e){
      System.out.println("Adición de Nuevo Usuario Fallida ");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*TODO eliminar usuarios*/
  public int deleteUser(String userName) {
    status = 0;
    
    try{
      
      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, userName);
      rs = ps.executeQuery();
      
      if(rs.next()){
        status = -50; /*El usuario no existe*/
      }else {
        sql = "CALL deleteUser(?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, userName);
        
        rs = ps.executeQuery();
      }
      
      if(status > 0){
        System.out.println("Eliminación del Usuario Exitosa");        
      }else {
        System.out.println("Eliminación del Usuario Fallida");
        System.out.println("Ya Existen Registros Asociados al Usuario");
      }
    }catch(SQLException e){
      System.out.println("Eliminación del Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Operaciones de proyectos*/
  /*Obtener todos los proyectos*/
  public ArrayList<Proyect> proyects() {
    p = new ArrayList<>();
    
    try{
      Proyect pr;
      
      sql = "CALL getProyects();";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      
      if(rs.next()){        
        do{
          pr = new Proyect();
          
          pr.setProyectNumber(rs.getInt(1));
          pr.setTitular(rs.getString(2));
          pr.setBalance(balance(pr.getProyectNumber()));
          
                    
          p.add(pr);
        }while(rs.next());
        
        System.out.println("Consulta de Proyectos Exitosa");
      }else {
        System.out.println("Consulta de Proyectos Exitosa");
        System.out.println("No hay Proyectos Que Mostrar");
      }
    }catch (SQLException e) {
      System.out.println("Consulta de Proyectos Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
   
   return p;
  }
  
  /*Obtener el balance de un proyecto*/
  public double balance(int proyectNumber) {
    double b = 0;
    
    try {
      sql = "CALL getIncomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      
      if(rs.next()){
        do {
          b += rs.getDouble(6);
        }while(rs.next());
        
        System.out.println("Consulta de Ingresos del proyecto" + proyectNumber + "Exitosa");
      }else {
        System.out.println("Consulta de Ingresos del proyecto" + proyectNumber + "Exitosa");
        System.out.println("No hay Ingresos Que Mostrar");
      }
      
      sql = "CALL getOutcomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      
      if(rs.next()){
        do {
          if(rs.getString(3).equals("C")){
            b -= rs.getDouble(8);
          }else {
            b += rs.getDouble(8);
          }  
        }while(rs.next());
        
        System.out.println("Consulta de Egresos del proyecto" + proyectNumber + "Exitosa");
      }else {
        System.out.println("Consulta de Egresos del proyecto" + proyectNumber + "Exitosa");
        System.out.println("No hay Ingresos Que Mostrar");
      }
      
    }catch(SQLException e) {
      System.out.println("Consulta de Proyectos Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return b;
  }
  
  /*Editar datos del proyecto*/
  public int updateProyect(int oldProyectNumber, Proyect newproyect) {
    status = 0;
    
    try{
      sql = "CALL updateProyect(?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldProyectNumber);
      ps.setInt(2, newproyect.getProyectNumber());
      ps.setString(3, newproyect.getTitular());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        System.out.println("Actualización del Proyecto" + oldProyectNumber + "Exitosa");        
      }else {
        System.out.println("Actualización del Proyecto" + oldProyectNumber + "Fallida");
        System.out.println("No hay Registros Asociados al Proyecto");
      }
    }catch(SQLException e){
      System.out.println("Actualización del Proyecto" + oldProyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Eliminar Proyecto*/
  public int deleteProyect(int proyectNumber) {
    status = 0;
    
    try {
      sql = "CALL deleteProyect(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      
      status = ps.executeUpdate();
      
      if(status > 0){
        System.out.println("Eliminación del Proyecto" + proyectNumber + "Existosa");
      }else{
        System.out.println("Eliminación del Proyecto" + proyectNumber + "Fallida");
        System.out.println("No Hay Registros Asociados al Proyecto");
      }
      
    }catch(SQLException e) {
      System.out.println("Eliminación del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Añadir proyecto*/
  public int addProyect(Proyect newProyect) {
    status = 0;
    
    try {
      sql = "CALL addProyect(?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, newProyect.getProyectNumber());
      ps.setString(2, newProyect.getTitular());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        p = proyects();
        
        System.out.println("Adición de Nuevo Proyecto Exitosa");
      }else {
        System.out.println("Adición de Nuevo Proyecto Fallida");
      }
    }catch(SQLException e) {
      System.out.println("Adición de Nuevo Proyecto Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Operaciones de ingresos*/
  /*Obtener todos los ingresos de un proyecto*/
  public ArrayList<Income> incomes(int proyectNumber) {    
    i = new ArrayList<>();
    
    try {
      Income in;
      
      sql = "CALL getIncomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
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
        
        System.out.println("Consulta de Ingresos del proyecto" + proyectNumber + "Exitosa");
      }else {
        System.out.println("Consulta de Ingresos del proyecto" + proyectNumber + "Exitosa");
        System.out.println("No hay Ingresos Que Mostrar");
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Ingresos del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return i;
  }
  
  /*Editar datos del ingreso*/
  public int updateIncome(int proyectNumber, int oldIncomeId, Income newIncome) {
    status = 0;
    
    try{
      sql = "CALL updateIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldIncomeId);
      ps.setString(2, newIncome.getExpenseCategory());
      ps.setString(3, newIncome.getExpenseSubCategory());
      ps.setString(4, newIncome.getConcept());
      ps.setFloat(5, newIncome.getAmount());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        i = incomes(proyectNumber);
        
        System.out.println("Actualización del Ingreso" + oldIncomeId + "Exitosa");         
      }else {
        System.out.println("Actualización del Ingreso" + oldIncomeId + "Fallida");
        System.out.println("No hay Registros Asociados al Ingreso");
      }
    }catch(SQLException e){
      System.out.println("Actualización del Ingreso" + oldIncomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Eliminar ingreso*/
  public int deleteIncome(int incomeId, int proyectNumber) {
    status = 0;
    
    try {
      sql = "CALL deleteIncome(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, incomeId);
      
      status = ps.executeUpdate();
      
      if(status > 0){
        i = incomes(proyectNumber);
        
        System.out.println("Eliminación del Ingreso" + incomeId + "Existosa");
      }else{
        System.out.println("Eliminación del Ingreso" + incomeId + "Fallida");
        System.out.println("No Hay Registros Asociados al Ingreso");
      }
      
    }catch(SQLException e) {
      System.out.println("Eliminación del Ingreso" + incomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Añadir ingreso*/
  public int addIncome(int proyectNumber, Income newIncome) {
    status = 0;
    
    try {
      sql = "CALL addIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      ps.setString(2, newIncome.getExpenseCategory());
      ps.setString(3, newIncome.getExpenseSubCategory());
      ps.setString(4, newIncome.getConcept());
      ps.setFloat(5, newIncome.getAmount());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        i = incomes(proyectNumber);
        
        System.out.println("Adición de Nuevo Ingreso Exitosa");
      }else {
        System.out.println("Adición de Nuevo Ingreso Fallida");
      }
    }catch(SQLException e) {
      System.out.println("Adición de Nuevo Ingreso Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Operaciones de egresos*/
  /*Obtener todos los egresos de un proyecto*/
  public ArrayList<Outcome> outcomes(int proyectNumber){
    o = new ArrayList<>();
    
    try {
      Outcome ou;
      
      sql = "CALL getOutcomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      o = new ArrayList<>();
      
      if(rs.next()) {
        do {
          ou = new Outcome();
          
          ou.setOutcomeId(rs.getInt(1));
          ou.setOrderDate(rs.getString(2));
          ou.setStartingNumber(rs.getInt(3));
          ou.setExpenseCategory(rs.getString(4));
          ou.setConcept(rs.getString(5));
          ou.setAmount(rs.getFloat(6));
          ou.setInvoiceNumber(rs.getString(7));
          ou.setTransferNumber(rs.getString(8));
          ou.setPolicyNumber(rs.getString(9));
          ou.setTransferDate(rs.getString(10));
          
          o.add(ou);
        }while(rs.next());
        
        System.out.println("Consulta de Egresos del proyecto" + proyectNumber + "Exitosa");
      }else {
        System.out.println("Consulta de Egresos del proyecto" + proyectNumber + "Exitosa");
        System.out.println("No hay Egresos Que Mostrar");
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Egresos del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
  
    return o;
  }
  
  /*Editar datos del egreso*/
  public int updateOutcome(int proyectNumber, int oldOutcomeId, Outcome newOutcome) {
    status = 0;
    
    try{
      sql = "CALL updateIncome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldOutcomeId);
      ps.setString(2, newOutcome.getOperationType());
      ps.setString(3, newOutcome.getOrderDate());
      ps.setInt(4, newOutcome.getStartingNumber());
      ps.setString(5, newOutcome.getExpenseCategory());
      ps.setString(6, newOutcome.getConcept());
      ps.setFloat(7, newOutcome.getAmount());
      ps.setString(8, newOutcome.getInvoiceNumber());
      ps.setString(9, newOutcome.getTransferNumber());
      ps.setString(10, newOutcome.getPolicyNumber());
      ps.setString(11, newOutcome.getTransferDate());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        o = outcomes(proyectNumber);
        
        System.out.println("Actualización del Ingreso" + oldOutcomeId + "Exitosa");         
      }else {
        System.out.println("Actualización del Ingreso" + oldOutcomeId + "Fallida");
        System.out.println("No hay Registros Asociados al Ingreso");
      }
    }catch(SQLException e){
      System.out.println("Actualización del Ingreso" + oldOutcomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Eliminar egreso*/
  public int deleteOutcome(int outcomeId, int proyectNumber) {
    status = 0;
    
    try {
      sql = "CALL deleteOutcome(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, outcomeId);
      
      status = ps.executeUpdate();
      
      if(status > 0){
        o = outcomes(proyectNumber);
        
        System.out.println("Eliminación del Ingreso" + outcomeId + "Existosa");
      }else{
        System.out.println("Eliminación del Ingreso" + outcomeId + "Fallida");
        System.out.println("No Hay Registros Asociados al Ingreso");
      }
      
    }catch(SQLException e) {
      System.out.println("Eliminación del Ingreso" + outcomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Añadir egreso*/
  public int addOutcome(int proyectNumber, Outcome newOutcome) {
    status = 0;
    
    try {
      sql = "CALL addOutcome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      ps.setString(2, newOutcome.getOperationType());
      ps.setString(3, newOutcome.getOrderDate());
      ps.setInt(4, newOutcome.getStartingNumber());
      ps.setString(5, newOutcome.getExpenseCategory());
      ps.setString(6, newOutcome.getConcept());
      ps.setFloat(7, newOutcome.getAmount());
      ps.setString(8, newOutcome.getInvoiceNumber());
      ps.setString(9, newOutcome.getTransferNumber());
      ps.setString(10, newOutcome.getPolicyNumber());
      ps.setString(11, newOutcome.getTransferDate());
      
      status = ps.executeUpdate();
      
      if(status > 0){
        o = outcomes(proyectNumber);
        
        System.out.println("Adición de Nuevo Egreso Exitosa");
      }else {
        System.out.println("Adición de Nuevo Egreso Fallida");
      }
    }catch(SQLException e) {
      System.out.println("Adición de Nuevo Egreso Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return status;
  }
  
  /*Getters y setters*/
  public Connection getCon() {
    return con;
  }

  public void setCon(Connection con) {
    this.con = con;
  }

  public ArrayList<Proyect> getP() {
    return p;
  }

  public void setP(ArrayList<Proyect> p) {
    this.p = p;
  }

  public ArrayList<Income> getI() {
    return i;
  }

  public void setI(ArrayList<Income> i) {
    this.i = i;
  }

  public ArrayList<Outcome> getO() {
    return o;
  }

  public void setO(ArrayList<Outcome> o) {
    this.o = o;
  }

  public ArrayList<User> getU() {
    return u;
  }

  public void setU(ArrayList<User> u) {
    this.u = u;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public String getSql() {
    return sql;
  }

  public void setSql(String sql) {
    this.sql = sql;
  }

  public PreparedStatement getPs() {
    return ps;
  }

  public void setPs(PreparedStatement ps) {
    this.ps = ps;
  }

  public ResultSet getRs() {
    return rs;
  }

  public void setRs(ResultSet rs) {
    this.rs = rs;
  }  
}