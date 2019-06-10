/**
 * Created by kamil.entsua-mensah on 10.06.2019.
 */
({
    editAccount: function(cmp, event, helper) {
        var recordLoader = cmp.find("recordLoader");
        recordLoader.saveRecord($A.getCallback(function(saveResult) {
            if (editAccount.state === "ERROR") {
                var errMsg = "";
                // saveResult.error is an array of errors,
                // so collect all errors into one message
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                cmp.set("v.recordSaveError", errMsg);
            } else {
                cmp.set("v.recordSaveError", "");
            }
        }));
    },
    // Control the component behavior here when record is changet (via any component)
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParam();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that are changed for this record
            var changedFields = eventParams.changedFields;
            consol.log('Fields that are changed: ' + JSON.stringify(changeFields));
            // record is changed so refresh the component (or other component logic)
            var result = $A.get("e.force.showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated"
            });
            resultsToast.fire();
        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
        } else if(eventParams.changeType == "ERROR") {
            console.log('Error: ' + component.get("v.error"));
        }
    }
})