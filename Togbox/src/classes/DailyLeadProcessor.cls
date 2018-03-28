global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> lds = [SELECT Id, Name FROM Lead WHERE LeadSource ='' LIMIT 200];
        for (Lead ld: lds) {
            ld.LeadSource = 'Dreamforce';
        }
        update lds;
    }
}