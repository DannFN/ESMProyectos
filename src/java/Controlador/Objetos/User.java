package Controlador.Objetos;

/**
 *
 * @author Daniel Flores
 */
public class User {
  private int userId;
  private char userType;
  private String userName;
  private String userPass;
  private String userRealName;
  private String userSurname;

  public User() {
    userId = 0;
    userType = ' ';
    userName = "";
    userPass = "";
    userRealName = "";
    userSurname = "";
  }

  public User(int userId, char userType, String userName, String userPass, String userRealName, String userSurname) {
    this.userId = userId;
    this.userType = userType;
    this.userName = userName;
    this.userPass = userPass;
    this.userRealName = userRealName;
    this.userSurname = userSurname;
  }  

  public User(char userType, String userName, String userPass, String userRealName, String userSurname) {
    this.userType = userType;
    this.userName = userName;
    this.userPass = userPass;
    this.userRealName = userRealName;
    this.userSurname = userSurname;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  public char getUserType() {
    return userType;
  }

  public void setUserType(char userType) {
    this.userType = userType;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserPass() {
    return userPass;
  }

  public void setUserPass(String userPass) {
    this.userPass = userPass;
  }

  public String getUserRealName() {
    return userRealName;
  }

  public void setUserRealName(String userRealName) {
    this.userRealName = userRealName;
  }

  public String getUserSurname() {
    return userSurname;
  }

  public void setUserSurname(String userSurname) {
    this.userSurname = userSurname;
  }
}
