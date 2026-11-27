public with sharing class ProgramSelector {
    public static List<Training_Program__c> getProgramsByStatus(String statusFilter) {
        String query =
            'SELECT Id, Name, Program_Code__c, Trainer__c, Trainer__r.First_Name__c, ' +
            'Trainer__r.Last_Name__c, Client__c, Client__r.Name, Program_Type__c, ' +
            'Technology_Track__c, Start_Date__c, End_Date__c, Status__c, ' +
            'Delivery_Mode__c, Location__c, Expected_Participants__c, ' +
            'Actual_Participants__c, Total_Training_Hours__c, Description__c, ' +
            'Passing_Score_Threshold__c, Total_Enrolled_Candidates__c, ' +
            'Mocks_Cleared_Candidates__c, Vouchers_Issued_Count__c, ' +
            'PD1_Certified_Count__c, BA_Certified_Count__c, ' +
            'Agentforce_Certified_Count__c, Total_Global_Certifications__c ' +
            'FROM Training_Program__c ';

        if (String.isNotBlank(statusFilter) && statusFilter != 'All') {
            query += 'WHERE Status__c = :statusFilter ';
        }
        query += 'WITH USER_MODE ORDER BY Start_Date__c DESC LIMIT 200';
        return Database.query(query);
    }

    public static List<Training_Program__c> getOngoingPrograms() {
        return getProgramsByStatus('Ongoing');
    }

    public static List<Training_Program__c> getUpcomingPrograms() {
        return getProgramsByStatus('Upcoming');
    }

    public static List<Training_Program__c> getCompletedPrograms() {
        return getProgramsByStatus('Completed');
    }

    public static List<Training_Program__c> getProgramsByTrainerId(Id trainerId) {
        if (trainerId == null) {
            return new List<Training_Program__c>();
        }
        Set<Id> phaseProgramIds = new Set<Id>();
        for (Program_Phase__c phase : [
            SELECT Training_Program__c
            FROM Program_Phase__c
            WHERE Assigned_Trainer__c = :trainerId
            AND Training_Program__c != null
            WITH USER_MODE
        ]) {
            phaseProgramIds.add(phase.Training_Program__c);
        }

        return [
            SELECT Id, Name, Program_Code__c, Trainer__c, Client__c, Client__r.Name,
                Program_Type__c, Technology_Track__c, Start_Date__c, End_Date__c,
                Status__c, Delivery_Mode__c, Location__c, Expected_Participants__c,
                Actual_Participants__c, Total_Training_Hours__c,
                Total_Enrolled_Candidates__c, Mocks_Cleared_Candidates__c,
                Vouchers_Issued_Count__c, PD1_Certified_Count__c,
                BA_Certified_Count__c, Agentforce_Certified_Count__c,
                Total_Global_Certifications__c
            FROM Training_Program__c
            WHERE Trainer__c = :trainerId
            OR Id IN :phaseProgramIds
            WITH USER_MODE
            ORDER BY Start_Date__c DESC
            LIMIT 200
        ];
    }
}