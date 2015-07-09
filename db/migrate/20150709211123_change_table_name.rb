class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :project_list, :projects
  end
end
