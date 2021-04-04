public interface SaleOpportunityRepository {
    SaleOpportunityQuerySpecification find();
    List<SaleOpportunity> getById(Set<Id> saleOpportunityIds);
    void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity);
    void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
    void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
}
