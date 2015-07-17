require 'rails_helper'

describe Project do
  it { should have_many :enrollments }

  it { should validate_presence_of :projectId }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :mask }
  it { should validate_presence_of :active }
end
