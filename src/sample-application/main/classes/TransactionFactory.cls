/**
 * Manages transactions
 */
public inherited sharing class TransactionFactory implements ITransactionFactory {

    /**
     * Start a new transaction
     *
     * @return
     */
    public ITransaction begin() {
        return new SFTransaction(new Map<Schema.SObjectType, SObjectDMLSettings>{
            Opportunity.SObjectType => new SObjectDMLSettings(Opportunity.SObjectType),
            OpportunityLineItem.SObjectType => new SObjectDMLSettings(OpportunityLineItem.SObjectType)
        });
    }
}
