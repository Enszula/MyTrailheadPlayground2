/**
 * Created by kamil.entsua-mensah on 21.05.2019.
 */
({
        createExpense: function(component, expense) {
            this.saveExpense(component, expense, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    var expenses = component.get("v.expenses");
                    expenses.push(response.getReturnValue());
                    component.set("v.expenses", expenses);
                }
            });
        },
        updateExpense: function(component, expense) {
            this.saveExpense(component, expense);
        },

        saveExpense: function(component, expense, callback) {
            var action = component.get("c.saveExpense");
            action.setParams({
                "expense": expense
            });
            if (callback) {
                action.setCallback(this, callback);
            }
            $A.enqueueAction(action);
        },
        updateExpense: function(component, expense) {
            var action = component.get("c.saveExpense");
            action.setParams({
                "expense": expense
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    // do nothing!
                }
            });
            $A.enqueueAction(action);
        },
        handleUpdateExpense: function(component, event, helper) {
            var updatedExp = event.getParam("expense");
            helper.updateExpense(component, updatedExp);
        },
})