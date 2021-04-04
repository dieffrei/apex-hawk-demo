public virtual inherited sharing class SaleOpportunity extends Entity {

    List<SaleOpportunityLineItem> items;

    protected SaleOpportunity() {
        super(Opportunity.SObjectType);
        this.items = new List<SaleOpportunityLineItem>();
    }

    public void applyDiscount(Decimal factor) {
        for (SaleOpportunityLineItem item : items) {
            item.applyDiscount(factor);
        }
    }

    public Decimal getTotalValue() {
        Decimal totalValue = 0;
        for (SaleOpportunityLineItem item : items) {
            totalValue += item.getUnitPrice();
        }
        return totalValue;
    }

}
