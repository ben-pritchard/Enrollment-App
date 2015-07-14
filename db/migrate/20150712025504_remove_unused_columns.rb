class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :enrollments, :status
    remove_column :enrollments, :projId
    remove_column :enrollments, :eligibility
  end
end
