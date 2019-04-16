package Controlador.Objetos;

import java.util.ArrayList;

/**
 *
 * @author Daniel Flores
 */
public class ConacytProyect {
  private int proyectNumber;
  private String proyectName;
  private String titular;
  private double balance;
  private ArrayList<ConacytIncome> incomes;
  private ArrayList<ConacytOutcome> outcomes;
  
  public ConacytProyect() {
    proyectNumber = 0;
    proyectName = "";
    titular = "";
    balance = 0;
    incomes = null;
    outcomes = null;
  }

  public ConacytProyect(int proyectNumber, String proyectName, String titular, double balance, ArrayList<ConacytIncome> incomes, ArrayList<ConacytOutcome> outcomes) {
    this.proyectNumber = proyectNumber;
    this.proyectName = proyectName;
    this.titular = titular;
    this.balance = balance;
    this.incomes = incomes;
    this.outcomes = outcomes;
  }
  
  public int getProyectNumber() {
    return proyectNumber;
  }

  public void setProyectNumber(int poyectNumber) {
    this.proyectNumber = poyectNumber;
  }

  public String getProyectName() {
    return proyectName;
  }

  public void setProyectName(String proyectName) {
    this.proyectName = proyectName;
  }
  
  public String getTitular() {
    return titular;
  }

  public void setTitular(String titular) {
    this.titular = titular;
  }

  public double getBalance() {
    return balance;
  }

  public void setBalance(double balance) {
    this.balance = balance;
  }

  public ArrayList<ConacytIncome> getIncomes() {
    return incomes;
  }

  public void setIncomes(ArrayList<ConacytIncome> incomes) {
    this.incomes = incomes;
  }

  public ArrayList<ConacytOutcome> getOutcomes() {
    return outcomes;
  }

  public void setOutcomes(ArrayList<ConacytOutcome> outcomes) {
    this.outcomes = outcomes;
  }
}
