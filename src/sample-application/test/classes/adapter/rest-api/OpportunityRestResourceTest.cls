@IsTest
private class OpportunityRestResourceTest {

    @IsTest
    static void getOpportunityById_getRightParameter() {

        // given
        SaleOpportunity saleOpportunity = new SaleOpportunityBuilder()
            .generateId()
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(13.59)
                .quantity(10))
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(15.01)
                .quantity(10))
            .build();

        fflib_ApexMocks mocks = new fflib_ApexMocks();
        SaleOpportunityService saleOpportunityService = (SaleOpportunityService) mocks.mock(SaleOpportunityService.class);
        mocks.startStubbing();
        {
            mocks.when(saleOpportunityService.getById((List<Id>)fflib_Match.anyList()))
                .thenReturn(new Map<Id, SaleOpportunity>{
                saleOpportunity.id => saleOpportunity
            });
        }
        mocks.stopStubbing();

        di_Injector.Org.Bindings.set(new di_Module()
            .bind(SaleOpportunityService.class)
            .toObject(saleOpportunityService));

        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/opportunity/discount?opportunityId=' + saleOpportunity.id;
        req.params.put(OpportunityRestResource.OPPORTUNITY_PARAM_NAME, saleOpportunity.id);
        req.httpMethod = 'GET';
        RestContext.request = req;

        // when
        SaleOpportunity result = OpportunityRestResource.getOpportunity();

        // assert
        System.assertNotEquals(null, result);
        System.assertEquals(saleOpportunity.id, result.id);
    }

}
