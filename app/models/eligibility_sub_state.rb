class EligibilitySubState < ActiveRecord::Base
  belongs_to :eligibility_state
  has_many :enrollment
end
