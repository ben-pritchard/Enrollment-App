class AddAssociations < ActiveRecord::Migration
  def change
    # rename_column :enrollments, :status, :enrollment_state_id
    add_column :enrollments, :enrollment_state_id, :integer
    rename_column :enrollments, :eligibility, :eligibility_state_id
    rename_column :enrollments, :projId, :project_id
  end
end
