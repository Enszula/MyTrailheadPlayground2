/**
 * Created by kamil.entsua-mensah on 24.05.2019.
 */

public with sharing class BusScheduleCache {
    private Cache.OrgPartition part;

    public BusScheduleCache() {
        this.part = Cache.Org.getPartition('local.BusSchedule');
    }

    public void putSchedule(String busLine, Time[] schedule) {
        part.put(busLine, schedule);
    }

    public Time[] getSchedule(String busLine) {
        Time[] result = new Time[]{};
        return (part.get(busLine) != null) ? (Time[]) part.get(busLine) : (Time[]) new Time[]{
                Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0)
        };

    }
}