public with sharing class EnrollmentSelector {
    public static List<Program_Enrollment__c> getEnrollmentsByProgramIds(Set<Id> programIds) {
        if (programIds == null || programIds.isEmpty()) {
            return new List<Program_Enrollment__c>();
        }
        return [
            SELECT Id, Name, Training_Program__c, Candidate_Name__c,
                   Candidate_Email__c, Trainer__c, Enrollment_Status__c,
                   Mock_Test_1_Score__c, Mock_Test_2_Score__c, Mock_Test_3_Score__c,
                   Mock_Test_1_Passed__c, Mock_Test_2_Passed__c, Mock_Test_3_Passed__c,
                   All_Mocks_Cleared__c, Voucher_Eligible__c, Voucher_Issued__c,
                   Voucher_Code__c, Voucher_Issued_Date__c
            FROM Program_Enrollment__c
            WHERE Training_Program__c IN :programIds
            WITH USER_MODE
            ORDER BY Candidate_Name__c ASC
        ];
    }
}