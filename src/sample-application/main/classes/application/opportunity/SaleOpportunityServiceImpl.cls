public inherited sharing class SaleOpportunityServiceImpl implements SaleOpportunityService {

    private SaleOpportunityRepository saleOpportunityRepository;

    public SaleOpportunityServiceImpl() {
        this.saleOpportunityRepository = saleOpportunityRepository;
    }

    public Map<Id, SaleOpportunity> getById(Set<Id> opportunityIds) {
        return new Map<Id, SaleOpportunity>();
    }

    public void applyDiscount(ITransaction salesforceTransaction, Set<Id> opportunityIds, Decimal factor) {
        for (SaleOpportunity opportunity : this.saleOpportunityRepository.getById(opportunityIds)) {
            opportunity.applyDiscount(factor);
        }
    }
}
