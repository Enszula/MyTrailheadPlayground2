/**
 * Created by kamil.entsua-mensah on 21.06.2019.
 */
({
    navigateTo: function(component, recId) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recId
        });
        navEvt.fire();
    }
})