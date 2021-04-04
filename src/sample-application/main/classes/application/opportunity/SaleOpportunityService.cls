public interface SaleOpportunityService {
    Map<Id, SaleOpportunity> getById(List<Id> opportunityIds);
    void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor);
}
