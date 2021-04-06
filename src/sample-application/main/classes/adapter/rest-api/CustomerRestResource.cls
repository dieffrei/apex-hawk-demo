@RestResource(UrlMapping='/customer/onboard')
global with sharing class CustomerRestResource {

    global class CustomerNewRequest {
        public String firstName;
        public String lastName;
    }

    @HttpPost
    global static String createCustomer(List<CustomerNewRequest> requests) {
        CustomerService customerService = (CustomerService) Injector.getInstance(CustomerService.class);
        ITransaction salesforceTransaction = new TransactionFactory().begin();
        customerService.create(salesforceTransaction, null);
        return null;
    }
}
