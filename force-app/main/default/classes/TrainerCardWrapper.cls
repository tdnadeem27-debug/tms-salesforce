public class TrainerCardWrapper {
    @AuraEnabled public Id trainerId { get; set; }
    @AuraEnabled public String trainerCode { get; set; }
    @AuraEnabled public String fullName { get; set; }
    @AuraEnabled public String email { get; set; }
    @AuraEnabled public String designation { get; set; }
    @AuraEnabled public String resourceType { get; set; }
    @AuraEnabled public String department { get; set; }
    @AuraEnabled public Decimal experienceYears { get; set; }
    @AuraEnabled public String specialization { get; set; }
    @AuraEnabled public String employmentStatus { get; set; }
    @AuraEnabled public String location { get; set; }
    @AuraEnabled public String profilePhotoUrl { get; set; }
    @AuraEnabled public String currentAvailabilityStatus { get; set; }
    @AuraEnabled public Decimal currentAvailabilityPercent { get; set; }
    @AuraEnabled public List<SkillItem> skills { get; set; }
    @AuraEnabled public List<CertificationItem> certifications { get; set; }
    @AuraEnabled public List<AssignedPhaseItem> activePhases { get; set; }

    public TrainerCardWrapper() {
        this.skills = new List<SkillItem>();
        this.certifications = new List<CertificationItem>();
        this.activePhases = new List<AssignedPhaseItem>();
        this.currentAvailabilityStatus = 'Available';
        this.currentAvailabilityPercent = 100;
    }

    public class SkillItem {
        @AuraEnabled public Id skillId { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public String category { get; set; }
        @AuraEnabled public String proficiency { get; set; }
        @AuraEnabled public Decimal yearsOfExperience { get; set; }
        @AuraEnabled public Boolean certified { get; set; }
    }

    public class CertificationItem {
        @AuraEnabled public Id certificationId { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public String provider { get; set; }
        @AuraEnabled public String status { get; set; }
        @AuraEnabled public Date issueDate { get; set; }
        @AuraEnabled public Date expiryDate { get; set; }
    }

    public class AssignedPhaseItem {
        @AuraEnabled public Id phaseId { get; set; }
        @AuraEnabled public String programName { get; set; }
        @AuraEnabled public String phaseType { get; set; }
        @AuraEnabled public String assignmentStatus { get; set; }
        @AuraEnabled public String phaseStatus { get; set; }
    }
}