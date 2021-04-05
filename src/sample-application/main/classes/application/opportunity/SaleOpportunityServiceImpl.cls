public inherited sharing class SaleOpportunityServiceImpl implements SaleOpportunityService {

    private SaleOpportunityRepository saleOpportunityRepository;

    public SaleOpportunityServiceImpl() {
        this.saleOpportunityRepository = (SaleOpportunityRepository) di_Injector.Org.getInstance(SaleOpportunityRepository.class);
    }

    public Map<Id, SaleOpportunity> getById(List<Id> opportunityIds) {
        return this.saleOpportunityRepository.getById(opportunityIds);
    }

    public void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor) {
        Map<Id, SaleOpportunity> opportunities = this.saleOpportunityRepository.getById(opportunityIds);
        for (SaleOpportunity opportunity : opportunities.values()) {
            opportunity.applyDiscount(factor);
            saleOpportunityRepository.save(salesforceTransaction, opportunity);
        }
    }

}
