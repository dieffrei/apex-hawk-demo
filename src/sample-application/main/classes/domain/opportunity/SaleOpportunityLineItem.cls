public virtual inherited sharing class SaleOpportunityLineItem extends Entity {

    protected SaleOpportunityLineItem() {
        super(OpportunityLineItem.SObjectType);
    }

    public SaleOpportunityLineItem(OpportunityLineItem record) {
        super(record);
    }

    public void applyDiscount(Decimal factor) {
        Decimal unitPrice = (Decimal) get(OpportunityLineItem.UnitPrice);
        put(OpportunityLineItem.UnitPrice, unitPrice - ((unitPrice / 100) * (factor)));
    }

    public Decimal getUnitPrice() {
        return (Decimal) get(OpportunityLineItem.UnitPrice);
    }

    public Decimal getTotalPrice() {
        return (Decimal) get(OpportunityLineItem.UnitPrice) * (Decimal) get(OpportunityLineItem.Quantity);
    }

}
