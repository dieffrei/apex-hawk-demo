public virtual inherited sharing class SaleOpportunityBuilder extends SaleOpportunity {

    public SaleOpportunityBuilder(){
        super();
    }

    @TestVisible
    private SaleOpportunityBuilder generateId() {
        this.put(Opportunity.Id, fflib_IDGenerator.generate(Opportunity.SObjectType));
        return this;
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
