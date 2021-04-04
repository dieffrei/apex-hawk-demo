@RestResource(UrlMapping='/opportunity/discount')
global with sharing class OpportunityRestResource {

    @HttpGet
    global static String getOpportunityById() {
        Set<Id> opportunityIds = null;
        SaleOpportunityService opportunityService = (SaleOpportunityService) di_Injector.Org.getInstance(SaleOpportunityService.class);
        return JSON.serialize(opportunityService.getById(opportunityIds));
    }

    @HttpPatch
    global static void applyDiscount(List<Id> opportunityIds, Decimal factor) {
        SaleOpportunityService opportunityService = (SaleOpportunityService) di_Injector.Org.getInstance(SaleOpportunityService.class);
        opportunityService.applyDiscount(new Set<Id>(opportunityIds), factor);
    }

}
