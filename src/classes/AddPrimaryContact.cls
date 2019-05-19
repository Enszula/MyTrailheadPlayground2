/**
 * Created by kamil.entsua-mensah on 17.05.2019.
 */

//TODO  -The execute method must query for a maximum of 200 Accounts with the BillingState specified
// by the State abbreviation passed into the constructor and insert the Contact sObject record associated to each Account. Look at the sObject clone() method.
//TODO  -Create an Apex test class called 'AddPrimaryContactTest'.
//TODO  -In the test class, insert 50 Account records for BillingState "NY" and 50 Account records
// for BillingState "CA". Create an instance of the AddPrimaryContact class, enqueue the job and assert that a Contact record was inserted for each of the 50 Accounts with the BillingState of "CA".
//TODO  -The unit tests must cover all lines of code included in the AddPrimaryContact class, resulting in 100% code coverage.
//TODO  -Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.

public with sharing class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id, BillingState FROM Account WHERE BillingState =: state LIMIT 200];
        List<Contact> contacts = [SELECT AccountId FROM Contact];
        for (Account acc: accounts) {
            Contact con = contact.clone(false, false, false, false);
            con.AccountId = acc.Id;
            contacts.add(con);
        }

        if (contacts.size() > 0)
            insert contacts;
    }
}