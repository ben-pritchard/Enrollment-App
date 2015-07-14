class EligibilityState < ActiveRecord::Base
  has_many :enrollments
end
