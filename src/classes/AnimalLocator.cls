/**
 * Created by kamil.entsua-mensah on 15.05.2019.
 */

public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String getString = '';
        // If the request is successfull, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animals = (Map<String, Object>)results.get('animal');
            System.debug('Received the following annimals:' + animals);
            getString = String.valueOf(animals.get('name'));
        }
        return getString;
    }

}