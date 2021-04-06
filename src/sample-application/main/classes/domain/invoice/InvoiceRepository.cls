public interface InvoiceRepository {
    InvoiceQuerySpec find();
    List<Invoice> getById(List<Id> invoiceIds);
    void save(ITransaction sfTransaction, Invoice invoice);
    void save(ITransaction sfTransaction, List<Invoice> invoices);
    void remove(ITransaction sfTransaction, List<Invoice> invoices);
}
