public inherited sharing class InvoiceQuerySpec extends QuerySpecification {

    public InvoiceQuerySpec() {
    }

    public InvoiceQuerySpec(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.Invoice__c.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.Invoice__c.Id
        };
    }

}
