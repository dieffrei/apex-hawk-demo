@IsTest
public class CustomerTest {

    @IsTest
    public static void constructor() {
        Customer customer = new Customer();
    }

    @IsTest
    public static void deactivate_DeactivateUser() {
        Customer customer = new Customer();
        customer.deactivate();
        System.assertEquals(false, customer.isActive());
    }

    @IsTest
    public static void activate_DeactivateUser() {
        Customer customer = new Customer();
        customer.activate();
        System.assertEquals(true, customer.isActive());
    }
}
