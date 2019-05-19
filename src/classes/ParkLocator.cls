/**
 * Created by kamil.entsua-mensah on 15.05.2019.
 */

public with sharing class ParkLocator {
    public static List<String> country(String countryName){
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return (List<String>)park.byCountry(countryName);
    }
}