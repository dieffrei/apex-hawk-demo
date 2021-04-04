public interface SaleOpportunityService {
    Map<Id, SaleOpportunity> getById(Set<Id> opportunityIds);
    void applyDiscount(ITransaction salesforceTransaction, Set<Id> opportunityIds, Decimal factor);
}
