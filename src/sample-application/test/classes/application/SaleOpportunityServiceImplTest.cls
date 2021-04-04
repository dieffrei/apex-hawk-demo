@IsTest
private class SaleOpportunityServiceImplTest {

    @IsTest
    static void constructor_Default_LoadDependencies() {
        new SaleOpportunityServiceImpl();
    }

    @IsTest
    static void getById_InvalidId_ThrowException() {

    }

    @IsTest
    static void applyDiscount_NoLines_CheckTotalValue() {

        SaleOpportunity saleOpportunity = new SaleOpportunityBuilder()
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(13.59)
                .quantity(10))
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(15.01)
                .quantity(10))
            .build();

        fflib_ApexMocks mocks = new fflib_ApexMocks();
        SaleOpportunityRepository opportunityRepository = (SaleOpportunityRepository) mocks.mock(SaleOpportunityRepository.class);
        Id opportunityId = fflib_IDGenerator.generate(Opportunity.SObjectType);
        mocks.startStubbing();
        {
            mocks.when(opportunityRepository.getById((List<Id>)fflib_Match.anyList()))
                .thenReturn(new Map<Id, SaleOpportunity>{
                opportunityId => saleOpportunity
            });
        }
        mocks.stopStubbing();

        di_Injector.Org.Bindings.add(new di_Module()
            .bind(SaleOpportunityRepository.class)
            .toObject(opportunityRepository));

        new SaleOpportunityServiceImpl()
            .applyDiscount(null, new List<Id>{
        }, 10);

    }

    @IsTest
    static void applyDiscoun_WithLines_CheckTotalValue() {

    }

}
