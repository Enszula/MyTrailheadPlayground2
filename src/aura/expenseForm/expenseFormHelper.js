/**
 * Created by kamil.entsua-mensah on 22.05.2019.
 */
({
    createExpense: function(component, newExpense) {
        var createEvent = component.getEvent("createExpense");
        createEvent.setParams({ "expense": newExpense });
        createEvent.fire();
    }
})