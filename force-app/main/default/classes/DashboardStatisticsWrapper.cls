public class DashboardStatisticsWrapper {
    @AuraEnabled public Integer totalTrainers { get; set; }
    @AuraEnabled public Integer totalEmployees { get; set; }
    @AuraEnabled public Integer ongoingPrograms { get; set; }
    @AuraEnabled public Integer upcomingPrograms { get; set; }
    @AuraEnabled public Integer completedPrograms { get; set; }
    @AuraEnabled public Integer totalEnrolledCandidates { get; set; }
    @AuraEnabled public Integer totalMocksCleared { get; set; }
    @AuraEnabled public Integer totalVouchersIssued { get; set; }
    @AuraEnabled public Integer totalPD1Certified { get; set; }
    @AuraEnabled public Integer totalBACertified { get; set; }
    @AuraEnabled public Integer totalAgentforceCertified { get; set; }
    @AuraEnabled public Integer totalGlobalCertifications { get; set; }

    public DashboardStatisticsWrapper() {
        this.totalTrainers = 0;
        this.totalEmployees = 0;
        this.ongoingPrograms = 0;
        this.upcomingPrograms = 0;
        this.completedPrograms = 0;
        this.totalEnrolledCandidates = 0;
        this.totalMocksCleared = 0;
        this.totalVouchersIssued = 0;
        this.totalPD1Certified = 0;
        this.totalBACertified = 0;
        this.totalAgentforceCertified = 0;
        this.totalGlobalCertifications = 0;
    }
}