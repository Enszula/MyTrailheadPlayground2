/**
 * Created by kamil.entsua-mensah on 16.05.2019.
 */

global with sharing class AccountProcessor {
    @future
    public static void countContacts(set<ID> Accnts){
        List<Account> acc = [select Name from Account where Id IN :accnts];
        List<Account> xyz = new List<Account>();
        for(Account a:acc){
            a.Number_of_Contacts__c = [select Count() from Contact where AccountId =:a.Id];
            xyz.add(a);
        }
        update xyz;
    }
}