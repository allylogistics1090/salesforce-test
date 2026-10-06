// Creates 20 sample loads across four carriers.
// Run with: sf apex run --file scripts/apex/seed-loads.apex
List<String> carriers = new List<String>{ 'Acme Freight', 'Blue Line Trucking', 'XYZ Logistics', 'Summit Carriers' };
List<Load__c> loads = new List<Load__c>();
for (Integer i = 0; i < 20; i++) {
    loads.add(new Load__c(
        Carrier__c = carriers[Math.mod(i, carriers.size())],
        Status__c = Math.mod(i, 2) == 0 ? 'Booked' : 'In Transit',
        Last_Status_Change__c = System.now().addDays(-i)
    ));
}
insert loads;
System.debug(loads.size() + ' loads created');
