/**
 * Created by kamil.entsua-mensah on 11.06.2019.
 */
({
    updateValue : function(component, event, helper) {
        var val = component.find("myInput").getElement().value;
        component.set("v.greeting", val);
    }
})
