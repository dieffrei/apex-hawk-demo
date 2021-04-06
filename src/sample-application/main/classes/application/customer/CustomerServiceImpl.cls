public inherited sharing class CustomerServiceImpl implements CustomerService {

    private CustomerRepository customerRepository;

    public CustomerServiceImpl() {
        this.customerRepository = (CustomerRepository) Injector.getInstance(CustomerRepository.class);
    }

    public void create(ITransaction salesforceTransaction, List<NewCustomerCommand> newCustomerCommands) {
        for (NewCustomerCommand newCustomerCommand : newCustomerCommands) {
            Customer customer = new CustomerBuilder()
                .firstName(newCustomerCommand.firstName)
                .lastName(newCustomerCommand.lastName)
                .build();
            customerRepository.save(salesforceTransaction, customer);
        }
    }

    public void activate(ITransaction salesforceTransaction, List<Id> customerIds) {
        for (Customer customer : this.customerRepository.getById(customerIds)) {
            customer.activate();
            customerRepository.save(salesforceTransaction, customer);
        }
    }

    public void deactivate(ITransaction salesforceTransaction, List<Id> customerIds) {
        List<Customer> customers = this.customerRepository.getById(customerIds);
        for (Customer customer : customers) {
            customer.deactivate();
        }
        customerRepository.save(salesforceTransaction, customers);
    }

}
