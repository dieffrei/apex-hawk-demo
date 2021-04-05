@IsTest
private class OpportunityRestResourceTest {

    @TestSetup
    public static void setup(){

    }

    @IsTest
    static void getOpportunityById_getRightParameter() {

        // given
        SaleOpportunity saleOpportunity = new SaleOpportunityBuilder()
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(13.59)
                .quantity(10))
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(15.01)
                .quantity(10))
            .build();

        fflib_ApexMocks mocks = new fflib_ApexMocks();
        SaleOpportunityService saleOpportunityService = (SaleOpportunityService) mocks.mock(SaleOpportunityService.class);
        Id opportunityId = fflib_IDGenerator.generate(Opportunity.SObjectType);
        mocks.startStubbing();
        {
            mocks.when(saleOpportunityService.getById((List<Id>)fflib_Match.anyList()))
                .thenReturn(new Map<Id, SaleOpportunity>{
                opportunityId => saleOpportunity
            });
        }
        mocks.stopStubbing();

        di_Injector.Org.Bindings.add(new di_Module()
            .bind(SaleOpportunityService.class)
            .toObject(saleOpportunityService));

        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/opportunity/discount?opportunityId=' + opportunityId;
        req.params.put(OpportunityRestResource.OPPORTUNITY_PARAM_NAME, opportunityId);
        req.httpMethod = 'GET';
        RestContext.request = req;

        // when
        String result = OpportunityRestResource.getOpportunity();

        // assert
        System.assertNotEquals(null, result);
        System.assertNotEquals(null, JSON.deserialize(result, SaleOpportunity.class));
    }

}
