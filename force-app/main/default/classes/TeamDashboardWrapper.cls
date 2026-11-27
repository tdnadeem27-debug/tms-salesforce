public class TeamDashboardWrapper {
    @AuraEnabled public DashboardStatisticsWrapper statistics { get; set; }
    @AuraEnabled public List<TrainerCardWrapper> resources { get; set; }
    @AuraEnabled public List<ProgramSummaryWrapper> programs { get; set; }

    public TeamDashboardWrapper() {
        this.statistics = new DashboardStatisticsWrapper();
        this.resources = new List<TrainerCardWrapper>();
        this.programs = new List<ProgramSummaryWrapper>();
    }
}