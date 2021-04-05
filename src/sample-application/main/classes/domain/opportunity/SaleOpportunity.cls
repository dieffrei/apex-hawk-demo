public virtual inherited sharing class SaleOpportunity extends Entity {

    protected List<SaleOpportunityLineItem> items;
    public Decimal totalValue_Test {public get; protected set;}

    protected SaleOpportunity() {
        super(Opportunity.SObjectType);
        this.totalValue_Test = 0;
        this.items = new List<SaleOpportunityLineItem>();
    }

    public void applyDiscount(Decimal factor) {
        for (SaleOpportunityLineItem item : items) {
            item.applyDiscount(factor);
        }
    }

    /**
     * @description slow method
     * @return
     */
    public Decimal getTotalValue() {
        Decimal totalValue = 0;
        for (SaleOpportunityLineItem item : items) {
            totalValue = totalValue + item.getTotalPrice();
        }
        return totalValue;
    }

}
