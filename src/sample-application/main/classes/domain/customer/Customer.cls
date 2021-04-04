public virtual inherited sharing class Customer extends Entity {

    @TestVisible
    protected Customer() {
        super(Account.SObjectType);
    }

    public void deactivate() {
        put(Account.IsActive__c, false);
    }

    public void activate() {
        put(Account.IsActive__c, true);
    }

    public Boolean isActive() {
        return (Boolean) get(Account.IsActive__c);
    }

}
