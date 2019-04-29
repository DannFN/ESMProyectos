package Controlador.Procesos;

import static java.lang.System.out;
import java.math.BigInteger;
import java.security.MessageDigest;
import static java.security.MessageDigest.getInstance;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;

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
      resHash = getInstance("MD5");
      byte[] bytesDelResumen = resHash.digest(msgBytes);

      BigInteger resumenNumero = new BigInteger(1, bytesDelResumen);
      resume = resumenNumero.toString(16);							
    } catch (NoSuchAlgorithmException e) {
      out.println("Fallo en el es cifrado de datos");
      out.println(e.getMessage());
      getLogger(DBOperations.class.getName()).log(SEVERE, null, e);
    }
    
    return resume;    
  }
}
