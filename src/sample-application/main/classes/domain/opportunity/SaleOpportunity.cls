global virtual inherited sharing class SaleOpportunity extends Entity {

    protected List<SaleOpportunityLineItem> items;

    protected SaleOpportunity() {
        super(Opportunity.SObjectType);
        this.items = new List<SaleOpportunityLineItem>();
    }

    protected SaleOpportunity(Opportunity record) {
        super(record);
        this.items = new List<SaleOpportunityLineItem>();
        for (OpportunityLineItem item : record.OpportunityLineItems){
            this.items.add(new SaleOpportunityLineItem(item));
        }
    }

    public void applyDiscount(Decimal factor) {
        for (SaleOpportunityLineItem item : items) {
            item.applyDiscount(factor);
        }
    }

    public Decimal getTotalValue() {
        Decimal totalValue = 0;
        for (SaleOpportunityLineItem item : items) {
            totalValue = totalValue + item.getTotalPrice();
        }
        return totalValue;
    }

}
