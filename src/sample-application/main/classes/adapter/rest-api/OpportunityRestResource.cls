@RestResource(UrlMapping='/opportunity/discount')
global with sharing class OpportunityRestResource {

    public static final String OPPORTUNITY_PARAM_NAME = 'opportunityId';

    @HttpGet
    global static SaleOpportunity getOpportunity() {
        Id opportunityId = RestContext.request.params.get(OPPORTUNITY_PARAM_NAME);
        SaleOpportunityService opportunityService = (SaleOpportunityService) Injector.getInstance(SaleOpportunityService.class);
        Map<Id, SaleOpportunity> saleOpportunities = opportunityService.getById(new List<Id>{
            opportunityId
        });
        return saleOpportunities.get(opportunityId);
    }

    @HttpPatch
    global static void applyDiscount(Id opportunityId, Decimal factor) {
        ITransaction salesforceTransaction = new TransactionFactory().begin();
        SaleOpportunityService opportunityService = (SaleOpportunityService) Injector.getInstance(SaleOpportunityService.class);
        opportunityService.applyDiscount(salesforceTransaction, new List<Id>{
            opportunityId
        }, factor);
        salesforceTransaction.commitZ();
    }

}
