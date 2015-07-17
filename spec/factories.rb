FactoryGirl.define do
  factory(:enrollment) do
    sequence(:subjId) { |n| "#{1}"}
    sequence(:homeId) { |n| "#{10}"}
    sequence(:RAId) { |n| "#{100}"}
    startDate('2003-07-04 00:00:00 UTC')
    enrollment_state_id('1')
    eligibility_state_id('1')
    eligibility_sub_state_id('1')
    project_id('1')
  end

  factory(:enrollment_state) do
    stateId('1')
    Name('Active')
    Display(true)
  end

  factory(:eligibility_state) do
    StateId('1')
    Title('Eligible')
  end

  factory(:eligibility_sub_state) do
    StateId('1')
    SubStateId('2')
    Title('Eligible')
    eligibility_state_id('1')
  end

  factory(:project) do
    projectId('1')
    name('Project1')
    description('Work')
    mask('1')
    active('1')
  end
end
