public inherited sharing class SaleOpportunityServiceImpl implements SaleOpportunityService {

    private SaleOpportunityRepository saleOpportunityRepository;

    public SaleOpportunityServiceImpl() {
        this.saleOpportunityRepository = (SaleOpportunityRepository) di_Injector.Org.getInstance(SaleOpportunityRepository.class);
    }

    public Map<Id, SaleOpportunity> getById(List<Id> opportunityIds) {
        return new Map<Id, SaleOpportunity>();
    }

    public void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor) {
        for (SaleOpportunity opportunity : this.saleOpportunityRepository.getById(opportunityIds).values()) {
            opportunity.applyDiscount(factor);
        }
    }
}
