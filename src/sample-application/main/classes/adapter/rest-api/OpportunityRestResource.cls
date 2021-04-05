@RestResource(UrlMapping='/opportunity/discount')
global with sharing class OpportunityRestResource {

    public static final String OPPORTUNITY_PARAM_NAME = 'opportunityId';

    @HttpGet
    global static String getOpportunity() {
        Id opportunityId = RestContext.request.params.get(OPPORTUNITY_PARAM_NAME);
        SaleOpportunityService opportunityService = (SaleOpportunityService) di_Injector.Org.getInstance(SaleOpportunityService.class);
        Map<Id, SaleOpportunity> saleOpportunities = opportunityService.getById(new List<Id>{
            opportunityId
        });
        return (saleOpportunities != null && saleOpportunities.containsKey(opportunityId))
            ? JSON.serialize(saleOpportunities.get(opportunityId))
            : null;
    }

    @HttpPatch
    global static void applyDiscount(List<Id> opportunityIds, Decimal factor) {
        ITransaction salesforceTransaction = new TransactionFactory().begin();
        SaleOpportunityService opportunityService = (SaleOpportunityService) di_Injector.Org.getInstance(SaleOpportunityService.class);
        opportunityService.applyDiscount(salesforceTransaction, opportunityIds, factor);
        salesforceTransaction.commitZ();
    }

}
