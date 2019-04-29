package Controlador.Procesos;

import Controlador.Objetos.ConacytIncome;
import Controlador.Objetos.ConacytOutcome;
import Controlador.Objetos.ConacytProyect;
import Controlador.Objetos.User;
import static Controlador.Procesos.Security.hash;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.logging.Level.SEVERE;
import static java.util.logging.Logger.getLogger;

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
  
  /*status de peticiones*/
  private static int status;

  /*variables de asignación de resultados (Listas)*/
  private static ArrayList<ConacytProyect> p;
  private static ArrayList<ConacytIncome> i;
  private static ArrayList<ConacytOutcome> o;
  private static ArrayList<User> u;

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
      out.println("Cierre Fallido");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }
  }

  /*--------------------Operaciones de usuario/sesion-------------------------*/
  /*Obtener datos del usuario/sesión*/
  public int login(String user, String pass) {
    status = 0;

    try {
      String temp;

      temp = hash(pass);

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
      out.println("Consulta de Datos de Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*Obtener datos de usuario para sesion*/
  public User user(String us){
    user = new User();

    try {
      sql = "CALL getUserData(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, us);
      rs = ps.executeQuery();

      if(rs.next()){
        do{
          user.setUserId(rs.getInt(1));
          user.setUserType(rs.getString(2).charAt(0));
          user.setUserName(rs.getString(3));
        }while(rs.next());
      }
    }catch(SQLException e) {
      user = null;
      out.println("Consulta de Datos de Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return user;
  }

  /*Obtener todos los usuarios*/
  public ArrayList<User> users() {
    u = new ArrayList<User>();

    try {
      sql = "CALL getUsers();";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();

      if(rs.next()){
        do {
          user = new User();

          user.setUserId(rs.getInt(1));
          user.setUserType(rs.getString(2).charAt(0));
          user.setUserName(rs.getString(3));

          u.add(user);
        }while(rs.next());
      }
    }catch(SQLException e) {
      out.println("Consulta de Usuarios Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return u;
  }

  /*Cambiar contraseña de usuarios propio*/
  public int changePUPass(String newPass, User user) {
    status = 0;

    try{
      String temp = hash(newPass);
      String temp1 = hash(user.getUserPass());

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
      out.println("Actualización de Datos de Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*TODO Cambiar contraseña de otros usuarios*/
  public int changeAUPass(String mUPass, String newPass, int userId) {
    status = 0;

    try{
      String temp = hash(mUPass);
      String temp1 = hash(newPass);

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
      out.println("Actualización de Datos de Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Actualización de Datos de Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*Añadir usuarios*/
  public int addUser(User newUser){
    status = 0;

    try{
      String temp = hash(newUser.getUserPass());

      sql = "CALL logIn(?);";
      ps = con.prepareStatement(sql);
      ps.setString(1, newUser.getUserName());
      rs = ps.executeQuery();

      if(rs.next()){
        status = -60; /*Ya existen registros asociados al "nuevo" usuario*/
      }else {
        sql = "CALL addUser(?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, valueOf(newUser.getUserType()));
        ps.setString(2, newUser.getUserName());
        ps.setString(3, temp);

        rs = ps.executeQuery();
      }
    }catch(SQLException e){
      out.println("Adición de Nuevo Usuario Fallida ");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Eliminación del Usuario Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*-------------------------Operaciones de proyectos-------------------------*/
  /*Obtener todos los proyectos*/
  public ArrayList<ConacytProyect> conacytProyects() {
    p = new ArrayList<ConacytProyect>();

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
      out.println("Consulta de Proyectos de Conacyt Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      }
    }catch(SQLException e) {
      cpro = null;
      out.println("Consulta de Proyecto de Conacyt Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }
    
    return cpro;
  }

  /*Obtener el balance de un proyecto*/
  public double conacytBalance(int proyectNumber) {
    double b = 0;

    try {
      sql = "CALL getConacytIncomesAmount(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();

      if(rs.next()){
        do {
          b += rs.getDouble(1);
        }while(rs.next());
      }

      sql = "CALL getConacytOutcomesAmount(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();

      if(rs.next()){
        do {
          if(rs.getString(1).equals("C")){
            b -= rs.getDouble(2);
          }else {
            b += rs.getDouble(2);
          }
        }while(rs.next());
      }
    }catch(SQLException e) {
      out.println("Consulta de Balance de Proyecto fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Actualización del Proyecto" + oldProyectNumber + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Eliminación del Proyecto" + proyectNumber + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Adición de Nuevo Proyecto Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*--------------------------Operaciones de ingresos-------------------------*/
  /*Obtener todos los ingresos de un proyecto*/
  public ArrayList<ConacytIncome> conacytIncomes(int proyectNumber) {
    i = new ArrayList<ConacytIncome>();

    try {
      sql = "CALL getConacytIncomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();

      if(rs.next()) {
        do {
          cin = new ConacytIncome();

          cin.setIncomeId(rs.getInt(1));
          cin.setConcept(rs.getString(3));
          cin.setExpenseCategory(rs.getString(4));
          cin.setExpenseSubCategory(rs.getString(5));
          cin.setAmount(rs.getFloat(6));

          i.add(cin);
        }while(rs.next());
      }
    }catch(SQLException e) {
      out.println("Consulta de Ingresos del Proyecto" + proyectNumber + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return i;
  }
  
  /*Añadir ingreso*/
  public int addConacytIncome(int proyectNumber, ConacytIncome newIncome) {
    status = 0;

    try {
      sql = "CALL addConacytIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      ps.setString(2, newIncome.getConcept());
      ps.setString(3, newIncome.getExpenseCategory());
      ps.setString(4, newIncome.getExpenseSubCategory());
      ps.setFloat(5, newIncome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e) {
      out.println("Adición de Nuevo Ingreso Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*Editar datos del ingreso*/
  public int updateConacytIncome(int proyectNumber, int oldIncomeId, ConacytIncome newIncome) {
    status = 0;

    try{
      sql = "CALL updateConacytIncome(?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, oldIncomeId);
      ps.setString(2, newIncome.getConcept());
      ps.setString(3, newIncome.getExpenseCategory());
      ps.setString(4, newIncome.getExpenseSubCategory());
      ps.setFloat(5, newIncome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e){
      out.println("Actualización del Ingreso" + oldIncomeId + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*Eliminar ingreso*/
  public int deleteConacytIncome(int incomeId) {
    status = 0;

    try {
      sql = "CALL deleteConacytIncome(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, incomeId);

      status = ps.executeUpdate();
    }catch(SQLException e) {
      out.println("Eliminación del Ingreso" + incomeId + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*-------------------------Operaciones de egresos---------------------------*/
  /*Obtener todos los egresos de un proyecto*/
  public ArrayList<ConacytOutcome> conacytOutcomes(int proyectNumber){
    o = new ArrayList<ConacytOutcome>();

    try {
      sql = "CALL getConacytOutcomes(?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      rs = ps.executeQuery();

      if(rs.next()) {
        do {
          cou = new ConacytOutcome();

          cou.setOutcomeId(rs.getInt(1));
          cou.setConcept(rs.getString(3));
          cou.setExpenseCategory(rs.getString(4));
          cou.setOperationType(rs.getString(5));
          cou.setOrderDate(rs.getString(6));
          cou.setOrderNumber(rs.getString(7));
          cou.setTransferDate(rs.getString(8));
          cou.setTransferNumber(rs.getString(9));
          cou.setStartingNumber(rs.getString(10));
          cou.setInvoiceNumber(rs.getString(11));
          cou.setPolicyNumber(rs.getString(12));
          cou.setAmount(rs.getFloat(13));

          o.add(cou);
        }while(rs.next());
      }
    }catch(SQLException e) {
      out.println("Consulta de Egresos del Proyecto" + proyectNumber + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return o;
  }

  /*Añadir egreso*/
  public int addOutcome(int proyectNumber, ConacytOutcome newOutcome) {
    status = 0;

    try {
      sql = "CALL addConacytOutcome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      ps.setInt(1, proyectNumber);
      ps.setString(2, newOutcome.getConcept());
      ps.setString(3, newOutcome.getExpenseCategory());
      ps.setString(4, newOutcome.getOperationType());
      ps.setString(5, newOutcome.getOrderDate());
      ps.setString(6, newOutcome.getOrderNumber());
      ps.setString(7, newOutcome.getTransferDate());
      ps.setString(8, newOutcome.getTransferNumber());
      ps.setString(9, newOutcome.getStartingNumber());
      ps.setString(10, newOutcome.getInvoiceNumber());
      ps.setString(11, newOutcome.getPolicyNumber());
      ps.setFloat(12, newOutcome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e) {
      out.println("Adición de Nuevo Egreso Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }
  
  /*Editar datos del egreso*/
  public int updateConacytOutcome(ConacytOutcome newOutcome) {
    status = 0;

    try{
      sql = "CALL updateConacytOutcome(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
      ps = con.prepareStatement(sql);
      
      ps.setInt(1, newOutcome.getOutcomeId());
      ps.setString(2, newOutcome.getConcept());
      ps.setString(3, newOutcome.getExpenseCategory());
      ps.setString(4, newOutcome.getOperationType());
      ps.setString(5, newOutcome.getOrderDate());
      ps.setString(6, newOutcome.getOrderNumber());
      ps.setString(7, newOutcome.getTransferDate());
      ps.setString(8, newOutcome.getTransferNumber());
      ps.setString(9, newOutcome.getStartingNumber());
      ps.setString(10, newOutcome.getInvoiceNumber());
      ps.setString(11, newOutcome.getPolicyNumber());
      ps.setFloat(12, newOutcome.getAmount());

      status = ps.executeUpdate();
    }catch(SQLException e){
      out.println("Actualización del Ingreso " + newOutcome.getOutcomeId() + " Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
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
      out.println("Eliminación del Ingreso" + outcomeId + "Fallida");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }

    return status;
  }

  /*---------------------------Getters y setters------------------------------*/
  public Connection getCon() {
    return con;
  }

  public void setCon(Connection con) {
    DBOperations.con = con;
  }

  public ArrayList<ConacytProyect> getP() {
    return p;
  }

  public void setP(ArrayList<ConacytProyect> p) {
    DBOperations.p = p;
  }

  public ArrayList<ConacytIncome> getI() {
    return i;
  }

  public void setI(ArrayList<ConacytIncome> i) {
    DBOperations.i = i;
  }

  public ArrayList<ConacytOutcome> getO() {
    return o;
  }

  public void setO(ArrayList<ConacytOutcome> o) {
    DBOperations.o = o;
  }

  public ArrayList<User> getU() {
    return u;
  }

  public void setU(ArrayList<User> u) {
    DBOperations.u = u;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    DBOperations.status = status;
  }

  public String getSql() {
    return sql;
  }

  public void setSql(String sql) {
    DBOperations.sql = sql;
  }

  public PreparedStatement getPs() {
    return ps;
  }

  public void setPs(PreparedStatement ps) {
    DBOperations.ps = ps;
  }

  public ResultSet getRs() {
    return rs;
  }

  public void setRs(ResultSet rs) {
    DBOperations.rs = rs;
  }
}
