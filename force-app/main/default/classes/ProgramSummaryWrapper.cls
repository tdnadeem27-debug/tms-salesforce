public class ProgramSummaryWrapper {
    @AuraEnabled public Id programId { get; set; }
    @AuraEnabled public String programName { get; set; }
    @AuraEnabled public String programCode { get; set; }
    @AuraEnabled public String clientName { get; set; }
    @AuraEnabled public String leadTrainerName { get; set; }
    @AuraEnabled public String programType { get; set; }
    @AuraEnabled public String technologyTrack { get; set; }
    @AuraEnabled public Date startDate { get; set; }
    @AuraEnabled public Date endDate { get; set; }
    @AuraEnabled public String status { get; set; }
    @AuraEnabled public String deliveryMode { get; set; }
    @AuraEnabled public Integer totalEnrolled { get; set; }
    @AuraEnabled public Integer mocksCleared { get; set; }
    @AuraEnabled public Integer vouchersIssued { get; set; }
    @AuraEnabled public Integer pd1Certified { get; set; }
    @AuraEnabled public Integer baCertified { get; set; }
    @AuraEnabled public Integer agentforceCertified { get; set; }
    @AuraEnabled public Integer totalGlobalCertifications { get; set; }
    @AuraEnabled public List<PhaseItem> phases { get; set; }

    public ProgramSummaryWrapper() {
        this.phases = new List<PhaseItem>();
    }

    public class PhaseItem {
        @AuraEnabled public Id phaseId { get; set; }
        @AuraEnabled public String phaseName { get; set; }
        @AuraEnabled public String phaseType { get; set; }
        @AuraEnabled public Integer sequenceOrder { get; set; }
        @AuraEnabled public Id assignedTrainerId { get; set; }
        @AuraEnabled public String assignedTrainerName { get; set; }
        @AuraEnabled public String assignmentStatus { get; set; }
        @AuraEnabled public String phaseStatus { get; set; }
        @AuraEnabled public Date startDate { get; set; }
        @AuraEnabled public Date endDate { get; set; }
        @AuraEnabled public Date relievedDate { get; set; }
    }
}