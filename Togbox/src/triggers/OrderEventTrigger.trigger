trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> tasks = new List<Task>();
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task tsk = new Task();
            tsk.Priority = 'Medium';
            tsk.Status = 'New';
            tsk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = '00558000001Rqtj';
            tasks.add(tsk);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert tasks;
}