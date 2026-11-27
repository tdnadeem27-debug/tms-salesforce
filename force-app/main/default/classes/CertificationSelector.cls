public with sharing class CertificationSelector {
    public static List<Trainer_Certification__c> getCertificationsByTrainerIds(Set<Id> trainerIds) {
        if (trainerIds == null || trainerIds.isEmpty()) {
            return new List<Trainer_Certification__c>();
        }
        return [
            SELECT Id, Name, Trainer__c, Certification_Provider__c,
                   Certification_ID__c, Issue_Date__c, Expiry_Date__c, Status__c
            FROM Trainer_Certification__c
            WHERE Trainer__c IN :trainerIds
            WITH USER_MODE
            ORDER BY Issue_Date__c DESC
        ];
    }
}