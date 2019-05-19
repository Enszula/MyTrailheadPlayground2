/**
 * Created by kamil on 19.05.19.
 */

trigger OrderEventTrigger on Order_Event__e (after insert) {
    // List to hold all tasks to be created
    List<Task> tasks = new List<Task>();

    for (Order_Event__e event: Trigger.new) {
        if (event.Has_Shipped__c==true) {
            Task task = new Task();
            task.Priority = 'Medium';
            task.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            task.OwnerId = event.CreatedById;
            tasks.add(task);
        }
    }

    // Insert all tasks corresponding to events received
    insert tasks;

}