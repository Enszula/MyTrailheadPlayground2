/**
 * Created by kamil on 22.05.19.
 */

({
    addItem : function(component, campaign) {
        var createEvent = compoenent.getEvent("addItem");
        createEvent.setParams({ "item": campaign})
        createEvent.fire();
        component.set("v.newItem", { 'sobjectType': 'Camping_item__c',
                                    'Name': '',
                                    'Quantity__c': 0,
                                    'Price__c': 0,
                                    'Packed__c': false});
    }
});