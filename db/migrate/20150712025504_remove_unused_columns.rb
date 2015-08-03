class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :enrollments, :status
    remove_column :enrollments, :projId
    remove_column :enrollments, :eligibility
    remove_column :enrollments, :secondary
    remove_column :enrollments, :idx
  end
end
