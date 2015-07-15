class EligibilityState < ActiveRecord::Base
  has_many :enrollments
  has_many :eligibility_sub_states
end
