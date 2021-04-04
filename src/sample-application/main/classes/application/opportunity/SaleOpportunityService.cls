public interface SaleOpportunityService {
    Map<Id, SaleOpportunity> getById(Set<Id> opportunityIds);
    void applyDiscount(Set<Id> opportunityIds, Decimal factor);
}
