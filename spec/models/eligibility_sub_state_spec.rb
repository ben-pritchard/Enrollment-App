require 'rails_helper'

describe EligibilitySubState do
  it { should have_many :enrollments }
  it { should belong_to :eligibility_state }

  it { should validate_presence_of :StateId }
  it { should validate_presence_of :SubStateId }
  it { should validate_presence_of :Title }
end
