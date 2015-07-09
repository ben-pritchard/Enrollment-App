class Enrollment < ActiveRecord::Base
  self.table_name = "enrollment"

  belongs_to :enrollment_state

  STATES = ["Withdrawn", "Available", "Screening", "Collaterals", "Neuropsych", "Clinician", "Take Ownership", "Ready To Install", "Active", "Deceased"]

  PROJECTS = ["Pool", "Project1", "Project2", "Project3", "Project4", "Project5", "Project6", "Project7", "Project8", "Project9", "Project10", "Project11", "Project12", "Project13"]
end
