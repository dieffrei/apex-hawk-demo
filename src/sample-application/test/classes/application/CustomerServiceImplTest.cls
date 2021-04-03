@IsTest
private class CustomerServiceImplTest {

    @IsTest
    static void create_correctArguments_customerCreated() {

        // setup
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        CustomerRepository customerRepositoryMock = (CustomerRepository) mocks.mock(CustomerRepository.class);

        di_Injector.Org.Bindings
            .add(new di_Module()
            .bind(CustomerRepository.class)
            .toObject(customerRepositoryMock));

        mocks.startStubbing();
        mocks.stopStubbing();

        List<NewCustomerCommand> customerCommands = new List<NewCustomerCommand>();
        customerCommands.add(new NewCustomerCommand('Maria', 'Clara'));
        customerCommands.add(new NewCustomerCommand('John', 'Antonie'));

        // when
        new CustomerServiceImpl()
            .create(null, null);

        // assert 2

    }
}
