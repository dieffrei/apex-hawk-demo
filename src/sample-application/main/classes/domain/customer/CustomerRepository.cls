public interface CustomerRepository {
    CustomerQuerySpecification find();
    List<Customer> getById(List<Id> customerIds);
    void save(ITransaction sfTransaction, Customer customer);
    void save(ITransaction sfTransaction, List<Customer> customers);
    void remove(ITransaction sfTransaction, List<Customer> customers);
}
