require 'rails_helper'

describe Enrollment do
  it { should belong_to :enrollment_state }
  it { should belong_to :eligibility_state }
  it { should belong_to :eligibility_sub_state }
  it { should belong_to :project }

  it { should validate_presence_of :subjId }
  it { should validate_presence_of :homeId }
  it { should validate_presence_of :RAId }
  it { should validate_presence_of :startDate }
  it { should validate_presence_of :enrollment_state }
  it { should validate_presence_of :eligibility_state }
  it { should validate_presence_of :project }
end
