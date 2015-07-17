require 'rails_helper'

describe EligibilityState do
  it { should have_many :enrollments }
  it { should have_many :eligibility_sub_states }

  it { should validate_presence_of :StateId }
  it { should validate_presence_of :Title }
end
