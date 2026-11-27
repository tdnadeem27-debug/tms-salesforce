public class TrainerDashboardWrapper {
    @AuraEnabled public TrainerCardWrapper trainerCard { get; set; }
    @AuraEnabled public List<ProgramSummaryWrapper> programs { get; set; }
    @AuraEnabled public List<Training_Session__c> recentSessions { get; set; }

    public TrainerDashboardWrapper() {
        this.programs = new List<ProgramSummaryWrapper>();
        this.recentSessions = new List<Training_Session__c>();
    }
}