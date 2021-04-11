public virtual inherited sharing class SaleOpportunityRepositoryImpl implements SaleOpportunityRepository {

    private SaleOpportunityQuerySpec querySpecification;

    @TestVisible
    private class SaleOpportunityBuilder extends SaleOpportunity implements IEntityBuilder {
        public Entity build(SObject record) {
            return new SaleOpportunity((Opportunity) record);
        }
    }

    @TestVisible
    private SaleOpportunityRepositoryImpl(SaleOpportunityQuerySpec querySpecification) {
        this.querySpecification = querySpecification;
    }

    public SaleOpportunityRepositoryImpl() {
        this.querySpecification = new SaleOpportunityQuerySpec(new SaleOpportunityBuilder());
    }

    public SaleOpportunityQuerySpec find() {
        return this.querySpecification;
    }

    public Map<Id, SaleOpportunity> getById(List<Id> saleOpportunityIds) {
        List<IEntity> results = this.querySpecification.findById(new Set<Id>(saleOpportunityIds)).toList();
        Map<Id, SaleOpportunity> opportunities = new Map<Id, SaleOpportunity>();
        for (IEntity result: results) {
            opportunities.put(result.getId(), (SaleOpportunity) result);
        }
        return opportunities;
    }

    public void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity) {
        save(sfTransaction, new List<SaleOpportunity>{salesOpportunity});
    }

    public void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
        for (SaleOpportunity saleOpportunity : saleOpportunities) {
            sfTransaction.save(saleOpportunity);
            for (SaleOpportunityLineItem item : saleOpportunity.items) {
                sfTransaction.save(item);
            }
        }
    }

    public void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
        sfTransaction.remove(saleOpportunities);
    }

}
