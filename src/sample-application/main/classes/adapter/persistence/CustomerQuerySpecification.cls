public virtual inherited sharing class CustomerQuerySpecification extends QuerySpecification {

    public CustomerQuerySpecification() {
    }

    public CustomerQuerySpecification(IEntityBuilder entityBuilder) {
        super(entityBuilder);
    }

    public SObjectType getSObjectType() {
        return Schema.Account.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
            Schema.Account.Id
//            Schema.Account.FirstName,
//            Schema.Account.LastName
        };
    }

}
