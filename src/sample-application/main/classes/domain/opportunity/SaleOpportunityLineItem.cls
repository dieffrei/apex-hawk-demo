public virtual inherited sharing class SaleOpportunityLineItem extends Entity {

    protected SaleOpportunityLineItem() {
        super(OpportunityLineItem.SObjectType);
    }

    public void applyDiscount(Decimal factor) {
        Decimal unitPrice = (Decimal) get(OpportunityLineItem.UnitPrice);
        put(OpportunityLineItem.UnitPrice, unitPrice * (factor));
    }

    public Decimal getUnitPrice() {
        return (Decimal) get(OpportunityLineItem.UnitPrice);
    }

}
