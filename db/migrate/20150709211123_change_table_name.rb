class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :project_list, :projects
    rename_table :enrollment, :enrollments
  end
end
