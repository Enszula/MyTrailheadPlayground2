/**
 * Created by kamil on 22.05.19.
 */

({
    clickCreateItem: function (component, event, helper) {
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.getSource('v.validity').valid;
        }, true);
        if (validCamping) {
            var addItm = event.getParam("v.newItem");
            helper.createItem(component, addItm);
        }
    }
});