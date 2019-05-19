/**
 * Created by kamil.entsua-mensah on 17.05.2019.
 */

global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctxt){
        List<Lead> updatedLeads = new List<Lead>();
        List<Lead> leads = [SELECT Name, LeadSource, Id FROM Lead WHERE LeadSource = '' LIMIT 200];
        for(Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
            updatedLeads.add(lead);
        }
        update updatedLeads;
    }
}