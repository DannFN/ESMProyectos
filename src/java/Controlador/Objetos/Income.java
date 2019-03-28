package Controlador.Objetos;

/**
 *
 * @author Daniel Flores
 */
public class Income {
  private int incomeId;
  private String expenseCategory;
  private String expenseSubCategory;
  private String concept;
  private float amount;

  public Income() {
    incomeId = 0;
    expenseCategory = "";
    expenseSubCategory = "";
    concept = "";
    amount = 0;
  }
  
  public Income(int incomeId, String expenseCategory, String expenseSubCategory, String concept, float amount) {
    this.incomeId = incomeId;
    this.expenseCategory = expenseCategory;
    this.expenseSubCategory = expenseSubCategory;
    this.concept = concept;
    this.amount = amount;
  }

  public int getIncomeId() {
    return incomeId;
  }

  public void setIncomeId(int incomeId) {
    this.incomeId = incomeId;
  }

  public String getExpenseCategory() {
    return expenseCategory;
  }

  public void setExpenseCategory(String expenseCategory) {
    this.expenseCategory = expenseCategory;
  }

  public String getExpenseSubCategory() {
    return expenseSubCategory;
  }

  public void setExpenseSubCategory(String expenseSubCategory) {
    this.expenseSubCategory = expenseSubCategory;
  }

  public String getConcept() {
    return concept;
  }

  public void setConcept(String concept) {
    this.concept = concept;
  }

  public float getAmount() {
    return amount;
  }

  public void setAmount(float amount) {
    this.amount = amount;
  }
}
