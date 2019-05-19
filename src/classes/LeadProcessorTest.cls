/**
 * Created by kamil.entsua-mensah on 16.05.2019.
 */
@isTest
public with sharing class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leadsList = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            leadsList.add(new Lead(FirstName = 'fName' + i, LastName = 'lname', Company = 'company'));
        }

        insert leadsList;
    }

    static testMethod void test() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}