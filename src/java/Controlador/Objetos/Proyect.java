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
  private int proyectNumber;
  private String titular;
  private double balance;
  private ArrayList<Income> incomes;
  private ArrayList<Outcome> outcomes;
  
  public Proyect() {
    proyectNumber = 0;
    titular = "";
    balance = 0;
    incomes = null;
    outcomes = null;
  }

  public Proyect(int proyectNumber, String titular, double balance, ArrayList<Income> incomes, ArrayList<Outcome> outcomes) {
    this.proyectNumber = proyectNumber;
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
