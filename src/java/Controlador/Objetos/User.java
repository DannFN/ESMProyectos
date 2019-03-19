/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Objetos;

/**
 *
 * @author elect
 */
public class User {
  private int userId;
  private char userType;
  private String userName;
  private String userPass;
  private boolean session;

  public User() {
    userId = 0;
    userType = ' ';
    userName = "";
    userPass = "";
    session = false;
  }

  public User(int userId, char userType, String userName, String userPass, boolean session) {
    this.userId = userId;
    this.userType = userType;
    this.userName = userName;
    this.userPass = userPass;
    this.session = session;
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

  public boolean isSession() {
    return session;
  }

  public void setSession(boolean session) {
    this.session = session;
  }  
}
