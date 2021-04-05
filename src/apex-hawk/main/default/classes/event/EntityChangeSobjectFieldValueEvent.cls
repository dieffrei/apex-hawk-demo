/**
 * Event dispatched always when a field is updated in the Entity
 * Subscribe events on Entities using Entity.addObserver()
 */
@NamespaceAccessible
public inherited sharing class EntityChangeSobjectFieldValueEvent extends EntityChangeEvent {

    public final SObjectField field;
    public final Object oldValue;
    public final Object newValue;

    public EntityChangeSobjectFieldValueEvent(SObjectField field, Object oldValue, Object newValue) {
        this.field = field;
        this.oldValue = oldValue;
        this.newValue = newValue;
    }

    override
    public String toString() {
        return JSON.serialize(new List<String>{
            String.valueOf(field), String.valueOf(oldValue), String.valueOf(newValue)
        });
    }
}
