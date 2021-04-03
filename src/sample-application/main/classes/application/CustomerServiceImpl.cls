public inherited sharing class CustomerServiceImpl implements CustomerService {

    private CustomerRepository customerRepository;

    public CustomerServiceImpl(){
        this.customerRepository = (CustomerRepository) di_Injector.Org.getInstance(CustomerRepository.class);
    }

}
