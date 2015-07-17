class EligibilitySubState < ActiveRecord::Base
  belongs_to :eligibility_state
  has_many :enrollments

  validates :StateId, presence: true
  validates :SubStateId, presence: true
  validates :Title, presence: true
end
