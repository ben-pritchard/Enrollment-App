class EligibilityState < ActiveRecord::Base
  has_many :enrollments
  has_many :eligibility_sub_states

  validates :StateId, presence: true
  validates :Title, presence: true
end
