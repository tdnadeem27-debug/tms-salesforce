public with sharing class TrainerSelector {
    public static Trainer__c getTrainerById(Id trainerId) {
        if (trainerId == null) {
            return null;
        }
        List<Trainer__c> trainers = [
            SELECT Id, Name, First_Name__c, Last_Name__c, Email__c, Phone__c,
                   Profile_Photo_URL__c, Designation__c, Resource_Type__c,
                   Employee_ID__c, Department__c, Experience_Years__c,
                   Specialization__c, Employment_Status__c, Joining_Date__c,
                   Manager__c, Manager__r.Name, Location__c, Bio__c
            FROM Trainer__c
            WHERE Id = :trainerId
            WITH USER_MODE
            LIMIT 1
        ];
        return trainers.isEmpty() ? null : trainers[0];
    }

    public static List<Trainer__c> getTrainersByManager(Id managerId) {
        if (managerId == null) {
            return new List<Trainer__c>();
        }
        return [
            SELECT Id, Name, First_Name__c, Last_Name__c, Email__c, Phone__c,
                   Profile_Photo_URL__c, Designation__c, Resource_Type__c,
                   Employee_ID__c, Department__c, Experience_Years__c,
                   Specialization__c, Employment_Status__c, Joining_Date__c,
                   Manager__c, Manager__r.Name, Location__c, Bio__c
            FROM Trainer__c
            WHERE Manager__c = :managerId
              AND Employment_Status__c != 'Inactive'
            WITH USER_MODE
            ORDER BY First_Name__c ASC, Last_Name__c ASC
        ];
    }

    public static List<Trainer__c> getActiveTrainersAndEmployees(String resourceTypeFilter) {
        String baseQuery =
            'SELECT Id, Name, First_Name__c, Last_Name__c, Email__c, Phone__c, ' +
            'Profile_Photo_URL__c, Designation__c, Resource_Type__c, ' +
            'Employee_ID__c, Department__c, Experience_Years__c, ' +
            'Specialization__c, Employment_Status__c, Joining_Date__c, ' +
            'Manager__c, Manager__r.Name, Location__c, Bio__c ' +
            'FROM Trainer__c ' +
            'WHERE Employment_Status__c != \'Inactive\' ';

        if (String.isNotBlank(resourceTypeFilter) && resourceTypeFilter != 'All') {
            baseQuery += 'AND Resource_Type__c = :resourceTypeFilter ';
        }
        baseQuery += 'WITH USER_MODE ORDER BY First_Name__c ASC, Last_Name__c ASC LIMIT 500';
        return Database.query(baseQuery);
    }
}