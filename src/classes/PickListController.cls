/**
 * Created by kamil.entsua-mensah on 12.06.2019.
 */

public with sharing class PickListController {
    @AuraEnabled
    public static List<String> getPickListValuesIntoList(String objectType, String selectedField) {
        List<String> pickListValuesList = new List<String>();
        Schema.SObjectType convertToObj = Schema.getGlobalDescribe().get(objectType);
        Schema.DescribeSObjectResult res = convertToObj.getDescribe();
        Schema.DescribeFieldResult fieldResult = res.fields.getMap().get(selectedField).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry picklistEntry : ple) {
            pickListValuesList.add(picklistEntry.getLabel());
        }

        return pickListValuesList;
    }
}