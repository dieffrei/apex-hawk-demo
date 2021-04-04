public inherited sharing class InvoiceQuerySpecification extends QuerySpecification {

    public InvoiceQuerySpecification() {
    }

    public InvoiceQuerySpecification(IEntityBuilder entityBuilder) {
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
