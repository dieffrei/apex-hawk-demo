@RestResource(UrlMapping='/opportunity/discount')
global with sharing class OpportunityRestResource {

    global class OpportunityInfo {
        public Id id {get;set;}
        public List<OpportunityLineItemInfo> items {get;set;}

        global OpportunityInfo(SaleOpportunity opportunity) {
            this.id = opportunity.id;
            this.items = new List<OpportunityLineItemInfo>();
            for (SaleOpportunityLineItem item : opportunity.items) {
                this.items.add(new OpportunityLineItemInfo(item));
            }
        }
    }

    global class OpportunityLineItemInfo {
        global Id id {get;set;}
        global Decimal unitPrice {get;set;}
        global Decimal quantity {get;set;}

        global OpportunityLineItemInfo(SaleOpportunityLineItem item){
            this.id = item.id;
            this.unitPrice = item.getUnitPrice();
            this.quantity = item.getQuantity();
        }
    }

    public static final String OPPORTUNITY_PARAM_NAME = 'opportunityId';

    @HttpGet
    global static OpportunityInfo getOpportunity() {
        Id opportunityId = RestContext.request.params.get(OPPORTUNITY_PARAM_NAME);
        SaleOpportunityService opportunityService = (SaleOpportunityService) Injector.getInstance(SaleOpportunityService.class);
        Map<Id, SaleOpportunity> saleOpportunities = opportunityService.getById(new List<Id>{
            opportunityId
        });
        if (saleOpportunities.containsKey(opportunityId)) {
            return new OpportunityInfo(saleOpportunities.get(opportunityId));
        }
        return null;
    }

    @HttpPatch
    global static void applyDiscount(Id opportunityId, Decimal factor) {
        ITransaction salesforceTransaction = new TransactionFactory()
            .begin()
            .verboseMode();
        SaleOpportunityService opportunityService = (SaleOpportunityService) Injector.getInstance(SaleOpportunityService.class);
        opportunityService.applyDiscount(salesforceTransaction, new List<Id>{
            opportunityId
        }, factor);
        salesforceTransaction.commitZ();
    }

}
