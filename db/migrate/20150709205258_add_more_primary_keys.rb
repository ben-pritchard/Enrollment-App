class AddPrimaryKeys < ActiveRecord::Migration
  def change
    add_column :eligibility_states, :id, :primary_key
    add_column :eligibility_sub_states, :id, :primary_key
    add_column :enrollment_states, :id, :primary_key
    add_column :project_list, :id, :primary_key
  end
end
