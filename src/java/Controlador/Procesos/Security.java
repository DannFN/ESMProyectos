package Controlador.Procesos;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel Flores
 */
public class Security {
 
  public Security() {
    /*empty constructor*/
  }
  
  public static String hash(String pass){
    String resume = "";
    byte[] msgBytes = pass.getBytes();

    MessageDigest resHash;
    
    try {
      resHash = MessageDigest.getInstance("MD5");
      byte[] bytesDelResumen = resHash.digest(msgBytes);

      BigInteger resumenNumero = new BigInteger(1, bytesDelResumen);
      resume = resumenNumero.toString(16);							
    } catch (NoSuchAlgorithmException e) {
      System.out.println("Fallo en el es cifrado de datos");
      System.out.println(e.getMessage());
      Logger.getLogger(DBOperations.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return resume;    
  }
}
