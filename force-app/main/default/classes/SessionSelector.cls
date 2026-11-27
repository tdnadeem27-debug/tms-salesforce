public with sharing class SessionSelector {
    public static List<Training_Session__c> getSessionsByProgramIds(Set<Id> programIds) {
        if (programIds == null || programIds.isEmpty()) {
            return new List<Training_Session__c>();
        }
        return [
            SELECT Id, Name, Training_Program__c, Program_Phase__c,
                   Program_Phase__r.Phase_Type__c, Session_Date__c,
                   Start_Time__c, End_Time__c, Topic__c, Session_Type__c,
                   Duration_Hours__c, Session_Status__c, Notes__c
            FROM Training_Session__c
            WHERE Training_Program__c IN :programIds
            WITH USER_MODE
            ORDER BY Session_Date__c ASC, Start_Time__c ASC
        ];
    }
}