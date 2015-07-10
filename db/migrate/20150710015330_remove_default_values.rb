class RemoveDefaultValues < ActiveRecord::Migration
  def change
    remove_column :enrollment, :status
    remove_column :enrollment, :projId
    remove_column :enrollment, :RAId
    remove_column :enrollment, :eligibility
    remove_column :enrollment, :secondary
    remove_column :enrollment, :idx
    add_column :enrollment, :status, :integer
    add_column :enrollment, :projId, :integer, null: false
    add_column :enrollment, :RAId, :integer
    add_column :enrollment, :eligibility, :integer, null: false
    add_column :enrollment, :secondary, :integer, null: false
    add_column :enrollment, :idx, :integer, null: false
  end
end
