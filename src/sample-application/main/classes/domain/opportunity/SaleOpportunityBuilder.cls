public virtual inherited sharing class SaleOpportunityBuilder extends SaleOpportunity {

    public SaleOpportunityBuilder(){
        super();
    }

    public SaleOpportunityBuilder addItem(SaleOpportunityLineItemBuilder itemBuilder) {
        SaleOpportunityLineItem item = itemBuilder.build();
        item.addObserver(this);
        super.items.add(item);
        return this;
    }

    public SaleOpportunity build(){
        return this;
    }
}
