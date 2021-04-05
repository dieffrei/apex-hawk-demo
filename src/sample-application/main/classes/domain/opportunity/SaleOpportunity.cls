public virtual inherited sharing class SaleOpportunity extends Entity {

    protected List<SaleOpportunityLineItem> items;
    public Decimal totalValue_Test {public get; protected set;}

    protected SaleOpportunity() {
        super(Opportunity.SObjectType);
        this.totalValue_Test = 0;
        this.items = new List<SaleOpportunityLineItem>();
        this.registerListeners();
    }

    public void registerListeners(){
        System.debug('registerListeners()');
        for (SaleOpportunityLineItem item : items) {
            item.addObserver(this);
        }
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

    /**
     * @description faster method
     * @param event
     */
    override
    public void onChange(EntityChangeEvent event){
        if (event instanceof EntityChangeSobjectFieldValueEvent) {
            updateTotalValue((EntityChangeSobjectFieldValueEvent) event);
        }
    }

    private void updateTotalValue(EntityChangeSobjectFieldValueEvent event){
        System.debug(JSON.serialize(event.toString()));
        if (event.field == OpportunityLineItem.UnitPrice){
            this.totalValue_Test = this.getTotalValue();
        }
    }

}
