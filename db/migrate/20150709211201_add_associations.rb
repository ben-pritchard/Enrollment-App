class AddAssociations < ActiveRecord::Migration
  def change
    add_column :enrollments, :enrollment_state_id, :integer
    add_column :enrollments, :eligibility_state_id, :integer
    add_column :enrollments, :eligibility_sub_state_id, :integer
    add_column :enrollments, :project_id, :integer
    add_column :eligibility_sub_states, :eligibility_state_id, :integer
  end
end
