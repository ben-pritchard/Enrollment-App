class Enrollment < ActiveRecord::Base
  belongs_to :enrollment_state
  belongs_to :project
  belongs_to :eligibility_state
  belongs_to :eligibility_sub_state

  validates :subjId, presence: true, numericality: { only_integer: true }
  validates :homeId, presence: true, numericality: { only_integer: true }
end
