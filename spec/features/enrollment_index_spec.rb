require 'rails_helper'

describe 'link on enrollment index to enrollment show page' do
  before do
    FactoryGirl.create(:enrollment_state)
    FactoryGirl.create(:eligibility_state)
    FactoryGirl.create(:eligibility_sub_state)
    FactoryGirl.create(:project)
    FactoryGirl.create(:enrollment)
  end

  it "clicks on an enrollment's subjId link" do
    visit '/enrollments'
    click_link '1', match: :first
    expect(page).to have_content 'Status History'
  end

  it "creates a new enrollment", js: true do
    visit '/enrollments'
    click_link 'New Enrollment'
    fill_in "Subject ID", with: 123
    fill_in "Home ID", with: 123
    fill_in "RAId", with: 123
    find('#enrollment_enrollment_state_id').find(:xpath, 'option[1]').select_option
    find('#enrollment_eligibility_state_id').find(:xpath, 'option[1]').select_option
    find('#enrollment_project_id').find(:xpath, 'option[1]').select_option
    fill_in "Start Date", with: '2003-07-04 00:00:00 UTC'
    click_on 'Submit'
    expect(page).to have_content 'successfully'

  end

  it "edit's an enrollment's information" do
    visit '/enrollments/1'
    click_link 'Edit'
    fill_in "Subject ID", with: 123
    click_on "Submit"
    expect(page).to have_content '123'
  end

  it "tests the delete enrollment process", js: true do
    visit '/enrollments/1'
    click_link 'Delete'
    # page.driver.browser.switch_to.alert.accept
    page.evaluate_script('window.confirm = function() { return true; }')
    expect(page).to have_content 'successfully'
  end

end
