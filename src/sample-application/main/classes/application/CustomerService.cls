public interface CustomerService {
    /**
     * @param salesforceTransaction unit of work
     * @param commands
     */
    void create(ITransaction salesforceTransaction, List<NewCustomerCommand> commands);
    void activate(ITransaction salesforceTransaction,List<Id> customerIds);
    void deactivate(ITransaction salesforceTransaction, List<Id> customerIds);
}
