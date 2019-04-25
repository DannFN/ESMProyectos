package Controlador.Procesos;

import Controlador.Objetos.ConacytIncome;
import Controlador.Objetos.ConacytOutcome;
import Controlador.Objetos.ConacytProyect;
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
  private static Connection con;
  
  /*variables de operaciones con la base de datos*/
  private static String sql;
  private static PreparedStatement ps;
  private static ResultSet rs;
  
  /*status de query*/
  private int status;

  /*variables de asignación de resultados (Listas)*/
  private ArrayList<ConacytProyect> p;
  private ArrayList<ConacytIncome> i;
  private ArrayList<ConacytOutcome> o;
  private ArrayList<User> u;

  /*variables de asignación de resultados (objetos individuales)*/
  private ConacytProyect cpro;
  private User user;
  private ConacytIncome cin;
  private ConacytOutcome cou;

  /*constructor de apertura de la conexión*/
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
    }catch(SQLException e) {
      System.out.println("Consulta de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Obtener datos de usuario para sesion*/
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
          us.setSession(true);
        }while(rs.next());
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return us;
  }

  /*Obtener todos los usuarios*/
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
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Usuarios Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return u;
  }

  /*Cambiar contraseña de usuarios propio*/
  public int changePUPass(String newPass, User user) {
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
    }catch(SQLException e){
      System.out.println("Actualización de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*TODO Cambiar contraseña de otros usuarios*/
  public int changeAUPass(String mUPass, String newPass, int userId) {
    status = 0;

    try{
      String temp = Security.hash(mUPass);
      String temp1 = Security.hash(newPass);

      sql = "CALL checkMU();";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();

      if(rs.getString(1).equals(temp)){
          sql = "CALL updatePass(?, ?);";
          ps = con.prepareStatement(sql);
          ps.setInt(1, userId);
          ps.setString(2, temp1);

          status = ps.executeUpdate();
      }else {
        status = -40; /*Las contraseñas para comprobación son diferentes*/
      }
    }catch(SQLException e){
      System.out.println("Actualización de Datos de Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

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
    }catch(SQLException e){
      System.out.println("Adición de Nuevo Usuario Fallida ");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Eliminar usuarios*/
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
    }catch(SQLException e){
      System.out.println("Eliminación del Usuario Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Operaciones de proyectos*/
  /*Obtener todos los proyectos*/
  public ArrayList<ConacytProyect> conacytProyects() {
    p = new ArrayList<>();

    try{
      ConacytProyect pr;

      sql = "CALL getConacytProyects();";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();

      if(rs.next()){
        do{
          pr = new ConacytProyect();

          pr.setProyectNumber(rs.getInt(1));
          pr.setProyectName(rs.getString(2));
          pr.setTitular(rs.getString(3));
          pr.setBalance(conacytBalance(pr.getProyectNumber()));

          p.add(pr);
        }while(rs.next());
      }
    }catch (SQLException e) {
      System.out.println("Consulta de Proyectos de Conacyt Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

   return p;
  }
  
  /*Obtener un proyecto en especifico*/
  public ConacytProyect conacytProyect(int proyectNumber) {
    cpro = new ConacytProyect();
    
    try {
      sql = "CALL getProyectData(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      
      if(rs.next()) {
        do {
          cpro.setProyectNumber(proyectNumber);
          cpro.setProyectName(rs.getString(2));
          cpro.setTitular(rs.getString(3)); 
          cpro.setBalance(conacytBalance(proyectNumber));
        }while(rs.next());
        
        cpro.setIncomes(conacytIncomes(proyectNumber));
        cpro.setOutcomes(conacytOutcomes(proyectNumber));        
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Proyecto de Conacyt Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return cpro;
  }

  /*Obtener el balance de un proyecto*/
  public double conacytBalance(int proyectNumber) {
    double b = 0;

    try {
      sql = "CALL getConacytIncomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();

      if(rs.next()){
        do {
          b += rs.getDouble(6);
        }while(rs.next());
      }

      sql = "CALL getConacytOutcomes(?);";
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
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Balance de Proyecto fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return b;
  }

  /*Editar datos del proyecto*/
  public int updateConacytProyect(int oldProyectNumber, ConacytProyect newProyect) {
    status = 0;

    try{
      sql = "CALL updateConacytProyect(?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldProyectNumber);
      ps.setInt(2, newProyect.getProyectNumber());
      ps.setString(3, newProyect.getProyectName());
      ps.setString(4, newProyect.getTitular());

      status = ps.executeUpdate();
    }catch(SQLException e){
      System.out.println("Actualización del Proyecto" + oldProyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Eliminar Proyecto*/
  public int deleteConacytProyect(int proyectNumber) {
    status = 0;

    try {
      sql = "CALL deleteConacytProyect(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);

      status = ps.executeUpdate();
    }catch(SQLException e) {
      System.out.println("Eliminación del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Añadir proyecto*/
  public int addConacytProyect(ConacytProyect newProyect) {
    status = 0;

    try {
      sql = "CALL addConacytProyect(?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, newProyect.getProyectNumber());
      ps.setString(2, newProyect.getProyectName());
      ps.setString(3, newProyect.getTitular());

      status = ps.executeUpdate();
    }catch(SQLException e) {
      System.out.println("Adición de Nuevo Proyecto Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Operaciones de ingresos*/
  /*Obtener todos los ingresos de un proyecto*/
  public ArrayList<ConacytIncome> conacytIncomes(int proyectNumber) {
    i = new ArrayList<>();

    try {
      ConacytIncome in;

      sql = "CALL getConacytIncomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      i = new ArrayList<>();

      if(rs.next()) {
        do {
          in = new ConacytIncome();

          in.setIncomeId(rs.getInt(1));
          in.setExpenseCategory(rs.getString(3));
          in.setExpenseSubCategory(rs.getString(4));
          in.setConcept(rs.getString(5));
          in.setAmount(rs.getFloat(6));

          i.add(in);
        }while(rs.next());
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Ingresos del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return i;
  }

  /*Editar datos del ingreso*/
  public int updateConacytIncome(int proyectNumber, int oldIncomeId, ConacytIncome newIncome) {
    status = 0;

    try{
      sql = "CALL updateConacytIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldIncomeId);
      ps.setString(2, newIncome.getExpenseCategory());
      ps.setString(3, newIncome.getExpenseSubCategory());
      ps.setString(4, newIncome.getConcept());
      ps.setFloat(5, newIncome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e){
      System.out.println("Actualización del Ingreso" + oldIncomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Eliminar ingreso*/
  public int deleteConacytIncome(int incomeId, int proyectNumber) {
    status = 0;

    try {
      sql = "CALL deleteConacytIncome(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, incomeId);

      status = ps.executeUpdate();
    }catch(SQLException e) {
      System.out.println("Eliminación del Ingreso" + incomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Añadir ingreso*/
  public int addConacytIncome(int proyectNumber, ConacytIncome newIncome) {
    status = 0;

    try {
      sql = "CALL addConacytIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      ps.setString(2, newIncome.getExpenseCategory());
      ps.setString(3, newIncome.getExpenseSubCategory());
      ps.setString(4, newIncome.getConcept());
      ps.setFloat(5, newIncome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e) {
      System.out.println("Adición de Nuevo Ingreso Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Operaciones de egresos*/
  /*Obtener todos los egresos de un proyecto*/
  public ArrayList<ConacytOutcome> conacytOutcomes(int proyectNumber){
    o = new ArrayList<>();

    try {
      ConacytOutcome ou;

      sql = "CALL getConacytOutcomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();
      o = new ArrayList<>();

      if(rs.next()) {
        do {
          ou = new ConacytOutcome();

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
      }
    }catch(SQLException e) {
      System.out.println("Consulta de Egresos del Proyecto" + proyectNumber + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return o;
  }

  /*Editar datos del egreso*/
  public int updateConacytOutcome(int proyectNumber, int oldOutcomeId, ConacytOutcome newOutcome) {
    status = 0;

    try{
      sql = "CALL updateConacytOutcome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
    }catch(SQLException e){
      System.out.println("Actualización del Ingreso" + oldOutcomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Eliminar egreso*/
  public int deleteConacytOutcome(int outcomeId, int proyectNumber) {
    status = 0;

    try {
      sql = "CALL deleteConacytOutcome(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, outcomeId);

      status = ps.executeUpdate();
    }catch(SQLException e) {
      System.out.println("Eliminación del Ingreso" + outcomeId + "Fallida");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }

    return status;
  }

  /*Añadir egreso*/
  public int addOutcome(int proyectNumber, ConacytOutcome newOutcome) {
    status = 0;

    try {
      sql = "CALL addConacytOutcome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
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

  public ArrayList<ConacytProyect> getP() {
    return p;
  }

  public void setP(ArrayList<ConacytProyect> p) {
    this.p = p;
  }

  public ArrayList<ConacytIncome> getI() {
    return i;
  }

  public void setI(ArrayList<ConacytIncome> i) {
    this.i = i;
  }

  public ArrayList<ConacytOutcome> getO() {
    return o;
  }

  public void setO(ArrayList<ConacytOutcome> o) {
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
