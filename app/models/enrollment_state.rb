class EnrollmentState < ActiveRecord::Base
  has_many :enrollments

  def self.states
    # Ignore “Ready to Install”, “Clinician” and “Neuropsych” enrollment states
    ignore_ids = [5, 6, 8]
    self.where.not(id: ignore_ids)
  end
end
