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
            OpportunityLineItem.SObjectType => new SObjectDMLSettings(OpportunityLineItem.SObjectType)
        });
    }
}
