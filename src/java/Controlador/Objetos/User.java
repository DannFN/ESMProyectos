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

  public User() {
    userId = 0;
    userType = ' ';
    userName = "";
    userPass = "";
  }

  public User(int userId, char userType, String userName, String userPass) {
    this.userId = userId;
    this.userType = userType;
    this.userName = userName;
    this.userPass = userPass;
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
}
