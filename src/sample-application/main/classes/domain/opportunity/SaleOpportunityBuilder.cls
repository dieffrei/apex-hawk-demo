public virtual inherited sharing class SaleOpportunityBuilder extends SaleOpportunity {

    public SaleOpportunityBuilder(){
        super();
    }

    public SaleOpportunityBuilder addItem(SaleOpportunityLineItemBuilder itemBuilder) {
        SaleOpportunityLineItem item = itemBuilder.build();
        this.items.add(item);
        return this;
    }

    public SaleOpportunity build(){
        return this;
    }
}
