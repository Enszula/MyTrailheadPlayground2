/**
 * Created by kamil.entsua-mensah on 17.05.2019.
 */
@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 33 14 * * ?';
    static testMethod void testScheduleJob(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i <200; i++){
            leads.add(new Lead(lastName = 'testLastName ' + i,
                    company = 'companyTest',
                    leadsource = ''));
        }
        insert leads;

        //execute batch
        Test.startTest();
        String jobid = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        System.assertEquals(200, [SELECT count() from Lead WHERE leadsource = 'Dreamforce']);

    }
}