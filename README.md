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

```apex
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
    - #### Repository interfaces
      Abstract the way you interact with persistense, it provides a way that usually you can inject different repository implementations either cache or mock.
        ```apex
        public interface SaleOpportunityRepository {
            SaleOpportunityQuerySpec find();
            Map<Id, SaleOpportunity> getById(List<Id> saleOpportunityIds);
            void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity);
            void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
            void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities);
        } 
        ```
    - #### Repository Implementation
        ```apex
        public virtual inherited sharing class SaleOpportunityRepositoryImpl implements SaleOpportunityRepository {
        
            private SaleOpportunityQuerySpec querySpecification;
        
            @TestVisible
            private class SaleOpportunityBuilder extends SaleOpportunity implements IEntityBuilder {
                public Entity build(SObject record) {
                    return new SaleOpportunity((Opportunity) record);
                }
            }
        
            @TestVisible
            private SaleOpportunityRepositoryImpl(SaleOpportunityQuerySpec querySpecification) {
                this.querySpecification = querySpecification;
            }
        
            public SaleOpportunityRepositoryImpl() {
                this.querySpecification = new SaleOpportunityQuerySpec(new SaleOpportunityBuilder());
            }
        
            public SaleOpportunityQuerySpec find() {
                return this.querySpecification;
            }
        
            public Map<Id, SaleOpportunity> getById(List<Id> saleOpportunityIds) {
                List<IEntity> results = this.querySpecification.findById(new Set<Id>(saleOpportunityIds)).toList();
                Map<Id, SaleOpportunity> opportunities = new Map<Id, SaleOpportunity>();
                for (IEntity result: results) {
                    opportunities.put(result.getId(), (SaleOpportunity) result);
                }
                return opportunities;
            }
        
            public void save(ITransaction sfTransaction, SaleOpportunity salesOpportunity) {
                save(sfTransaction, new List<SaleOpportunity>{salesOpportunity});
            }
        
            public void save(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
                for (SaleOpportunity saleOpportunity : saleOpportunities) {
                    sfTransaction.save(saleOpportunity);
                    for (SaleOpportunityLineItem item : saleOpportunity.items) {
                        sfTransaction.save(item);
                    }
                }
            }
        
            public void remove(ITransaction sfTransaction, List<SaleOpportunity> saleOpportunities){
                sfTransaction.remove(saleOpportunities);
            }
        
        } 
        ```
- ### Query Specifications
    Low level api to query sobject records (It uses fflib query factory + selector)
  
- ### Application Services
  Communicates aggregate roots, performs complex use cases, cross aggregates transaction. An operation offered as an interface that stands alone in the model, with no encapsulated state.
    ```apex
    public interface SaleOpportunityService {
        Map<Id, SaleOpportunity> getById(List<Id> opportunityIds);
        void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor);
    }
    ```
    ```apex
    public inherited sharing class SaleOpportunityServiceImpl implements SaleOpportunityService {
    
        private SaleOpportunityRepository saleOpportunityRepository;
    
        public SaleOpportunityServiceImpl() {
            this.saleOpportunityRepository = (SaleOpportunityRepository) Injector.getInstance(SaleOpportunityRepository.class);
        }
    
        public Map<Id, SaleOpportunity> getById(List<Id> opportunityIds) {
            return this.saleOpportunityRepository.getById(opportunityIds);
        }
    
        public void applyDiscount(ITransaction salesforceTransaction, List<Id> opportunityIds, Decimal factor) {
            Map<Id, SaleOpportunity> opportunities = this.saleOpportunityRepository.getById(opportunityIds);
            for (SaleOpportunity opportunity : opportunities.values()) {
                opportunity.applyDiscount(factor);
                saleOpportunityRepository.save(salesforceTransaction, opportunity);
            }
        }
    
    }
    ```
