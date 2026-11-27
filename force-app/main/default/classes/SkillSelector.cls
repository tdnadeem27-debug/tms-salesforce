public with sharing class SkillSelector {
    public static List<Trainer_Skill__c> getSkillsByTrainerIds(Set<Id> trainerIds) {
        if (trainerIds == null || trainerIds.isEmpty()) {
            return new List<Trainer_Skill__c>();
        }
        return [
            SELECT Id, Name, Trainer__c, Skill_Category__c, Proficiency__c,
                   Years_of_Experience__c, Certified__c
            FROM Trainer_Skill__c
            WHERE Trainer__c IN :trainerIds
            WITH USER_MODE
            ORDER BY Proficiency__c DESC, Name ASC
        ];
    }
}