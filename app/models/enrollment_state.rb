class EnrollmentState < ActiveRecord::Base
  has_many :enrollments

  validates :stateId, presence: true
  validates :Name, presence: true
  validates :Display, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["Name"] + _ransackers.keys
  end

  def self.states
    # Ignore “Ready to Install”, “Clinician” and “Neuropsych” enrollment states ('try's are there for specs)
    ignore_ids = [EnrollmentState.find_by(Name: "Ready to install").try(:id),
                  EnrollmentState.find_by(Name: "Clinician").try(:id), EnrollmentState.find_by(Name: "Neuropsych").try(:id)]
    self.where.not(id: ignore_ids)
  end
end
