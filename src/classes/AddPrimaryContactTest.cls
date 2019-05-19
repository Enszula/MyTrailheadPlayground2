/**
 * Created by kamil.entsua-mensah on 17.05.2019.
 */
@isTest
public with sharing class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name = 'Test' + i, BillingState = 'NY'));
        }

        for (Integer j = 0; j < 50; j++) {
            accounts.add(new Account(Name = 'Test' + j, BillingState = 'CA'));
        }

        insert accounts;
    }

    static testMethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact contact = new Contact(FirstName = 'firstNameaddprimcon', LastName = 'addprimcon');
        String billingState = 'CA';

        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact, billingState);

        Test.startTest();
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();

        // Validate the job ran. Check if record was inserted for each of the 50 accs with the BillingSTate of CA
        System.assertEquals(50, [SELECT count() FROM Account WHERE BillingState = 'CA']);
    }
}