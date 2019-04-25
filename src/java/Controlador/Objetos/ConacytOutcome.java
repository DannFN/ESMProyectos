package Controlador.Objetos;

/**
 *
 * @author Daniel Flores
 */
public class ConacytOutcome {
  private int outcomeId; //id egreso
  private String concept; //concepto
  private String expenseCategory; //categoria de gasto
  private String operationType; //tipo de operacion
  private String orderDate; //fecha de pedido
  private String orderNumber; //numero de pedido
  private String transferDate; //numero de transferencia
  private String transferNumber; //fecha de transferencia
  private String startingNumber; //numero de partida
  private String invoiceNumber; //numero de factura
  private String policyNumber; //numero de poliza
  private float amount; //importe

  public ConacytOutcome(){
    outcomeId = 0;
    concept = "";
    expenseCategory = "";
    operationType = "";
    orderDate = "";
    orderNumber = ""; 
    transferDate = "";
    transferNumber = "";
    startingNumber = "";
    invoiceNumber = "";
    policyNumber = "";
    amount = 0;
  }

  public ConacytOutcome(int outcomeId, String concept, String expenseCategory, String operationType, String orderDate, String orderNumber, String transferDate, String transferNumber, String startingNumber, String invoiceNumber, String policyNumber, float amount) {
    this.outcomeId = outcomeId;
    this.concept = concept;
    this.expenseCategory = expenseCategory;
    this.operationType = operationType;
    this.orderDate = orderDate;
    this.orderNumber = orderNumber;
    this.transferDate = transferDate;
    this.transferNumber = transferNumber;
    this.startingNumber = startingNumber;
    this.invoiceNumber = invoiceNumber;
    this.policyNumber = policyNumber;
    this.amount = amount;
  }

  public int getOutcomeId() {
    return outcomeId;
  }

  public void setOutcomeId(int outcomeId) {
    this.outcomeId = outcomeId;
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

  public String getOrderNumber() {
    return orderNumber;
  }

  public void setOrderNumber(String orderNumber) {
    this.orderNumber = orderNumber;
  }

  public String getTransferDate() {
    return transferDate;
  }

  public void setTransferDate(String transferDate) {
    this.transferDate = transferDate;
  }

  public String getTransferNumber() {
    return transferNumber;
  }

  public void setTransferNumber(String transferNumber) {
    this.transferNumber = transferNumber;
  }

  public String getStartingNumber() {
    return startingNumber;
  }

  public void setStartingNumber(String startingNumber) {
    this.startingNumber = startingNumber;
  }

  public String getInvoiceNumber() {
    return invoiceNumber;
  }

  public void setInvoiceNumber(String invoiceNumber) {
    this.invoiceNumber = invoiceNumber;
  }

  public String getPolicyNumber() {
    return policyNumber;
  }

  public void setPolicyNumber(String policyNumber) {
    this.policyNumber = policyNumber;
  }

  public float getAmount() {
    return amount;
  }

  public void setAmount(float amount) {
    this.amount = amount;
  }
}
