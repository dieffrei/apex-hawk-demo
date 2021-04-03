public virtual inherited sharing class Customer extends Entity {

    protected Customer() {
        super(Account.SObjectType);
    }

    public void deactivate(){
        put(Account.IsActive__c, false);
    }

    public void activate(){
        put(Account.IsActive__c, true);
    }

}
