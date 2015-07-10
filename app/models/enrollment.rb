class Enrollment < ActiveRecord::Base
  self.table_name = "enrollment"

  belongs_to :enrollment_state
  belongs_to :project

  validates :subjId, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :homeId, presence: true, numericality: { only_integer: true }

  before_create :assign_status

  def assign_status
    self.assign_attributes(status: EnrollmentState.find(self.enrollment_state_id).stateId)
  end

end
