package Controlador.Objetos;

/**
 *
 * @author Daniel Flores
 */
public class ConacytIncome {
  private int incomeId;
  private String concept;
  private String expenseCategory;
  private String expenseSubCategory;
  private float amount;

  public ConacytIncome() {
    incomeId = 0;
    concept = "";
    expenseCategory = "";
    expenseSubCategory = "";
    amount = 0;
  }

  public ConacytIncome(int incomeId, String concept, String expenseCategory, String expenseSubCategory, float amount) {
    this.incomeId = incomeId;
    this.concept = concept;
    this.expenseCategory = expenseCategory;
    this.expenseSubCategory = expenseSubCategory;
    this.amount = amount;
  }

  public int getIncomeId() {
    return incomeId;
  }

  public void setIncomeId(int incomeId) {
    this.incomeId = incomeId;
  }

  public String getConcept() {
    return concept;
  }

  public void setConcept(String concept) {
    this.concept = concept;
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

  public float getAmount() {
    return amount;
  }

  public void setAmount(float amount) {
    this.amount = amount;
  }
}
