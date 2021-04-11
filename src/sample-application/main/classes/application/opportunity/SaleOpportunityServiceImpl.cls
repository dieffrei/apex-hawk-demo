public inherited sharing class SaleOpportunityServiceImpl implements SaleOpportunityService {

    private SaleOpportunityRepository saleOpportunityRepository;

    public SaleOpportunityServiceImpl() {
        this.saleOpportunityRepository = (SaleOpportunityRepository) Injector.getInstance(SaleOpportunityRepository.class);
    }

    public Map<Id, SaleOpportunity> getById(List<Id> opportunityIds) {
        return this.saleOpportunityRepository.getById(opportunityIds);
    }

    public void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor) {
        Map<Id, SaleOpportunity> opportunities = this.saleOpportunityRepository.getById(opportunityIds);
        System.debug('opportunities = ' + JSON.serialize(opportunities));
        for (SaleOpportunity opportunity : opportunities.values()) {
            opportunity.applyDiscount(factor);
            saleOpportunityRepository.save(salesforceTransaction, opportunity);
        }
    }

}
