public inherited sharing class CustomerServiceImpl implements CustomerService {

    private CustomerRepository customerRepository;

    public CustomerServiceImpl(){
        this.customerRepository = (CustomerRepository) di_Injector.Org.getInstance(CustomerRepository.class);
    }

    public void create(ITransaction salesforceTransaction, List<NewCustomerCommand> newCustomerCommands) {
        for (NewCustomerCommand newCustomerCommand : newCustomerCommands){
            Customer customer = new CustomerBuilder()
                .firstName(newCustomerCommand.firstName)
                .lastName(newCustomerCommand.lastName)
                .build();
            customerRepository.save(salesforceTransaction, customer);
        }
    }

    public void activate(ITransaction salesforceTransaction, List<Id> customerIds) {
        List<Customer> customers = null; //this.customerRepository.find()
        for (Customer customer : customers) {
            customer.activate();
        }
        customerRepository.save(salesforceTransaction, customers);
    }

    public void deactivate(ITransaction salesforceTransaction, List<Id> customerIds) {
        List<Customer> customers = null; //this.customerRepository.find()
        for (Customer customer : customers) {
            customer.deactivate();
        }
        customerRepository.save(salesforceTransaction, customers);
    }

}
