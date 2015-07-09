class AddAssociations < ActiveRecord::Migration
  def change
    add_column :enrollment, :enrollment_state_id, :integer
    add_column :enrollment, :eligibility_state_id, :integer
    add_column :enrollment, :eligibility_sub_state_id, :integer
    add_column :enrollment, :project_id, :integer
  end
end
