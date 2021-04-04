public inherited sharing class SaleOpportunityQuerySpecification extends QuerySpecification {

    public SaleOpportunityQuerySpecification() {
    }

    public SaleOpportunityQuerySpecification(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.Opportunity.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.Opportunity.Id
        };
    }

}
