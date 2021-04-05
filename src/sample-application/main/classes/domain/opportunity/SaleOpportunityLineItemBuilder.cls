public virtual inherited sharing class SaleOpportunityLineItemBuilder extends SaleOpportunityLineItem {

    public SaleOpportunityLineItemBuilder() {
        super();
    }

    public SaleOpportunityLineItemBuilder quantity(Decimal quantity) {
        put(OpportunityLineItem.Quantity, quantity);
        return this;
    }

    public SaleOpportunityLineItemBuilder unitPrice(Decimal unitPrice) {
        put(OpportunityLineItem.UnitPrice, unitPrice);
        return this;
    }

    public SaleOpportunityLineItem build() {
        return this;
    }

}
