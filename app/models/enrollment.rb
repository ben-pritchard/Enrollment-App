class Enrollment < ActiveRecord::Base
  belongs_to :enrollment_state
  belongs_to :project

  validates :subjId, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :homeId, presence: true, numericality: { only_integer: true }
end
