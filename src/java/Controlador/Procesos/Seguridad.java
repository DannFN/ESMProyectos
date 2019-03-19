/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Procesos;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author elect
 */
public class Seguridad {
 
  public Seguridad() {
    /*empty constructor*/
  }
  
  public String hashPass(String pass){
    String resume = "";
    byte[] msgBytes = pass.getBytes();

    MessageDigest resHash;
    
    try {
      resHash = MessageDigest.getInstance("MD5");
      byte[] bytesDelResumen = resHash.digest(msgBytes);

      BigInteger resumenNumero = new BigInteger(1, bytesDelResumen);
      resume = resumenNumero.toString(16);							
    } catch (NoSuchAlgorithmException e) {
      System.out.println(e.getMessage());
    }
    
    return resume;    
  }
}
