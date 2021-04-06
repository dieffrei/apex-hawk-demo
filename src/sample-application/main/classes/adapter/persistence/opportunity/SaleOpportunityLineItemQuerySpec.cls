public inherited sharing class SaleOpportunityLineItemQuerySpec extends QuerySpecification {

    public SaleOpportunityLineItemQuerySpec() {
    }

    public SaleOpportunityLineItemQuerySpec(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.OpportunityLineItem.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.OpportunityLineItem.Id,
            Schema.OpportunityLineItem.UnitPrice,
            Schema.OpportunityLineItem.Quantity
        };
    }

}
