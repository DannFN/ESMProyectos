package Controlador.Objetos;

/**
 *
 * @author Daniel Flores
 */
public class Outcome {
  private int outcomeId;
  private String operationType;
  private String orderDate;
  private int startingNumber;
  private String expenseCategory;
  private String concept;
  private float amount;
  private String invoiceNumber;
  private String transferNumber;
  private String policyNumber;
  private String transferDate;

  public Outcome(){
    outcomeId = 0;
    operationType = "";
    orderDate = "";
    startingNumber = 0;
    expenseCategory = "";
    concept = "";
    amount = 0;
    invoiceNumber = "";
    transferNumber = "";
    policyNumber = "";
    transferDate = "";
  }
  
  public Outcome(int outcomeId, String operationType, String orderDate, int startingNumber, String expenseCategory, String concept, float amount, String invoiceNumber, String transferNumber, String policyNumber, String transferDate) {
    this.outcomeId = outcomeId;
    this.operationType = operationType;
    this.orderDate = orderDate;
    this.startingNumber = startingNumber;
    this.expenseCategory = expenseCategory;
    this.concept = concept;
    this.amount = amount;
    this.invoiceNumber = invoiceNumber;
    this.transferNumber = transferNumber;
    this.policyNumber = policyNumber;
    this.transferDate = transferDate;
  }

  public int getOutcomeId() {
    return outcomeId;
  }

  public void setOutcomeId(int outcomeId) {
    this.outcomeId = outcomeId;
  }
  
  public String getOperationType() {
    return operationType;
  }

  public void setOperationType(String operationType) {
    this.operationType = operationType;
  }
  
  public String getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(String orderDate) {
    this.orderDate = orderDate;
  }

  public int getStartingNumber() {
    return startingNumber;
  }

  public void setStartingNumber(int startingNumber) {
    this.startingNumber = startingNumber;
  }

  public String getExpenseCategory() {
    return expenseCategory;
  }

  public void setExpenseCategory(String expenseCategory) {
    this.expenseCategory = expenseCategory;
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

  public String getInvoiceNumber() {
    return invoiceNumber;
  }

  public void setInvoiceNumber(String invoiceNumber) {
    this.invoiceNumber = invoiceNumber;
  }

  public String getTransferNumber() {
    return transferNumber;
  }

  public void setTransferNumber(String transferNumber) {
    this.transferNumber = transferNumber;
  }

  public String getPolicyNumber() {
    return policyNumber;
  }

  public void setPolicyNumber(String policyNumber) {
    this.policyNumber = policyNumber;
  }

  public String getTransferDate() {
    return transferDate;
  }

  public void setTransferDate(String transferDate) {
    this.transferDate = transferDate;
  }
}
