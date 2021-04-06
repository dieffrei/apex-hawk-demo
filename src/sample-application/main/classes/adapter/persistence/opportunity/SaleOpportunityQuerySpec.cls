public inherited sharing class SaleOpportunityQuerySpec extends QuerySpecification {

    public SaleOpportunityQuerySpec() {
    }

    public SaleOpportunityQuerySpec(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.Opportunity.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.Opportunity.Id,
            Schema.Opportunity.Amount,
            Schema.Opportunity.Name
        };
    }

    public QueryResult findById(Set<Id> opportunityIds) {
        super.queryFactory.setCondition('Id IN :opportunityIds');
        super.queryFactory.subselectQuery('OpportunityLineItems')
            .selectFields(new Set<Schema.SObjectField>{
                OpportunityLineItem.Id,
                OpportunityLineItem.UnitPrice,
                OpportunityLineItem.Quantity,
                OpportunityLineItem.TotalPrice
            });
        return new QueryResult(this.entityBuilder, Database.query(this.queryFactory.toSOQL()));
    }

}
