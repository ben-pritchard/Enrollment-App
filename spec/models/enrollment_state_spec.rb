require 'rails_helper'

describe EnrollmentState do
  it { should have_many :enrollments }

  it { should validate_presence_of :stateId }
  it { should validate_presence_of :Name }
  it { should validate_presence_of :Display }
end
