global class LeadProcessor implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,Name, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> records){
        for (Lead ld : records) {
            ld.LeadSource = 'Dreamforce';
        }
        update records;
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    

}