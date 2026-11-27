public with sharing class ProgramPhaseSelector {
    public static List<Program_Phase__c> getPhasesByProgramIds(Set<Id> programIds) {
        if (programIds == null || programIds.isEmpty()) {
            return new List<Program_Phase__c>();
        }
        return [
            SELECT Id, Name, Training_Program__c, Phase_Type__c, Sequence_Order__c,
                   Assigned_Trainer__c, Assigned_Trainer__r.First_Name__c,
                   Assigned_Trainer__r.Last_Name__c, Assignment_Status__c,
                   Start_Date__c, End_Date__c, Relieved_Date__c, Phase_Status__c, Notes__c
            FROM Program_Phase__c
            WHERE Training_Program__c IN :programIds
            WITH USER_MODE
            ORDER BY Sequence_Order__c ASC, Start_Date__c ASC
        ];
    }

    public static List<Program_Phase__c> getPhasesByTrainerIds(Set<Id> trainerIds) {
        if (trainerIds == null || trainerIds.isEmpty()) {
            return new List<Program_Phase__c>();
        }
        return [
            SELECT Id, Name, Training_Program__c, Training_Program__r.Name,
                   Training_Program__r.Program_Code__c, Phase_Type__c,
                   Sequence_Order__c, Assigned_Trainer__c, Assignment_Status__c,
                   Start_Date__c, End_Date__c, Relieved_Date__c, Phase_Status__c
            FROM Program_Phase__c
            WHERE Assigned_Trainer__c IN :trainerIds
            WITH USER_MODE
            ORDER BY Start_Date__c DESC
        ];
    }
}