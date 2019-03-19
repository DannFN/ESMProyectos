/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Objetos;

import java.util.ArrayList;

/**
 *
 * @author elect
 */
public class Proyect {
  private int poyectNumber;
  private String titular;
  private double balance;
  private ArrayList<Income> incomes;
  private ArrayList<Outcome> outcomes;
  
  public Proyect() {
    poyectNumber = 0;
    titular = "";
    balance = 0;
    incomes = null;
    outcomes = null;
  }

  public Proyect(int poyectNumber, String titular, double balance, ArrayList<Income> incomes, ArrayList<Outcome> outcomes) {
    this.poyectNumber = poyectNumber;
    this.titular = titular;
    this.balance = balance;
    this.incomes = incomes;
    this.outcomes = outcomes;
  }
  
  public int getPoyectNumber() {
    return poyectNumber;
  }

  public void setPoyectNumber(int poyectNumber) {
    this.poyectNumber = poyectNumber;
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

  public ArrayList<Income> getIncomes() {
    return incomes;
  }

  public void setIncomes(ArrayList<Income> incomes) {
    this.incomes = incomes;
  }

  public ArrayList<Outcome> getOutcomes() {
    return outcomes;
  }

  public void setOutcomes(ArrayList<Outcome> outcomes) {
    this.outcomes = outcomes;
  }
}
