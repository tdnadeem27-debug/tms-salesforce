public with sharing class AvailabilitySelector {
    public static List<Trainer_Availibility__c> getAvailabilityByTrainerIds(Set<Id> trainerIds) {
        if (trainerIds == null || trainerIds.isEmpty()) {
            return new List<Trainer_Availibility__c>();
        }
        Date todayDate = Date.today();
        return [
            SELECT Id, Name, Trainer__c, Available_From__c, Available_To__c,
                   Availability_Percentage__c, Status__c, Reason__c
            FROM Trainer_Availibility__c
            WHERE Trainer__c IN :trainerIds
              AND Available_To__c >= :todayDate
            WITH USER_MODE
            ORDER BY Available_From__c ASC
        ];
    }
}