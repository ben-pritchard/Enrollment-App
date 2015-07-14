class AddAssociations < ActiveRecord::Migration
  def change
    # rename_column :enrollments, :status, :enrollment_state_id
    add_column :enrollments, :enrollment_state_id, :integer
    add_column :enrollments, :eligibility_state_id, :integer
    add_column :enrollments, :project_id, :integer
  end
end
