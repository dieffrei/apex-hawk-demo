public virtual inherited sharing class CustomerQuerySpec extends QuerySpecification {

    public CustomerQuerySpec() {
    }

    public CustomerQuerySpec(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.Account.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.Account.Id
        };
    }

}
