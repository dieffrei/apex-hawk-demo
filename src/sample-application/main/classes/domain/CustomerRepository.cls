public interface CustomerRepository {
    void find();
    void save(ITransaction sfTransaction, Customer customer);
    void save(ITransaction sfTransaction, List<Customer> customers);
    void remove(ITransaction sfTransaction, List<Customer> customers);
}
