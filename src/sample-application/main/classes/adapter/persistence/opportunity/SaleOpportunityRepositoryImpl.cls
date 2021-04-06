public virtual inherited sharing class SaleOpportunityRepositoryImpl implements SaleOpportunityRepository {

    private SaleOpportunityQuerySpecification querySpecification;

    @TestVisible
    private class SaleOpportunityBuilder extends SaleOpportunity implements IEntityBuilder {
        public Entity build(SObject record) {
            return new SaleOpportunity((Opportunity) record);
        }
    }

    @TestVisible
    private SaleOpportunityRepositoryImpl(SaleOpportunityQuerySpecification querySpecification) {
        this.querySpecification = querySpecification;
    }

    public SaleOpportunityRepositoryImpl() {
        this.querySpecification = new SaleOpportunityQuerySpecification(new SaleOpportunityBuilder());
    }

    public SaleOpportunityQuerySpecification find() {
        return this.querySpecification;
    }

    public Map<Id, SaleOpportunity> getById(List<Id> saleOpportunityIds) {
        List<IEntity> results = this.querySpecification.byId(new Set<Id>(saleOpportunityIds)).toList();
        Map<Id, SaleOpportunity> opportunities = new Map<Id, SaleOpportunity>();
        for (IEntity result: results) {
            opportunities.put(result.getId(), (SaleOpportunity) result);
        }
        return opportunities;
    }

    public void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity) {
        sfTransaction.save(salesOpportunity);
    }

    public void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
        sfTransaction.save(saleOpportunities);
    }

    public void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
        sfTransaction.remove(saleOpportunities);
    }

}
