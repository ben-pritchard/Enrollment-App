class RemoveStatusColumn < ActiveRecord::Migration
  def change
    remove_column :enrollments, :status
  end
end
