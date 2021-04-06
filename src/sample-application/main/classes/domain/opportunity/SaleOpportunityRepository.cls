public interface SaleOpportunityRepository {
    SaleOpportunityQuerySpec find();
    Map<Id, SaleOpportunity> getById(List<Id> saleOpportunityIds);
    void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity);
    void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
    void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
}
