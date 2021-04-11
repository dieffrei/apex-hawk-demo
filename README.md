# Salesforce Apex Hawk

The purpose of apex hawk is to facilitate ability to apply SOLID principles, good coding practices it born in a attemp to apply Dom Driven Design concepts.
One of the biggest problems in salesforce development is that everything is tight to database, since of nature of salesforce, it makes the thing really difficult to decouple them.

## Building blocks
An application can be split into smaller block, each one has very specific responsibility
- ### Domains objects
  Domain object are abstractions on top of SObjects.
  To create a Domain object just extend Entity class.
  Entity instances are persisted to database using SFTransaction (ApexHawk UnitOfWork implementation).
  Only changed field values are persisted to database. 
  (It is possible since entity classes implements Observer pattern.

```
public virtual inherited sharing class SaleOpportunity extends Entity {

  public List<SaleOpportunityLineItem> items { public get; protected set; }

  protected SaleOpportunity() {
    super(Opportunity.SObjectType);
    this.items = new List<SaleOpportunityLineItem>();
  }

  protected SaleOpportunity(Opportunity record) {
    super(record);
    this.items = new List<SaleOpportunityLineItem>();
    for (OpportunityLineItem item : record.OpportunityLineItems) {
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
```
  
- ### Repositories

  
- ### Query Specifications
- ### Application Services


## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
