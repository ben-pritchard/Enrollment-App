class Enrollment < ActiveRecord::Base
  self.table_name = "enrollment"

  belongs_to :enrollment_state
  belongs_to :project

  validates :subjId, presence: true, uniqueness: true, numericality: { only_integer: true }

end
