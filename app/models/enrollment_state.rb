class EnrollmentState < ActiveRecord::Base
  has_many :enrollments

  validates :stateId, presence: true
  validates :Name, presence: true
  validates :Display, presence: true

  def self.states
    # Ignore “Ready to Install”, “Clinician” and “Neuropsych” enrollment states
    ignore_ids = [EnrollmentState.find_by(Name: "Ready to install").id,
                  EnrollmentState.find_by(Name: "Clinician").id, EnrollmentState.find_by(Name: "Neuropsych").id]
    self.where.not(id: ignore_ids)
  end
end
