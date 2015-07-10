class AddEnrollmentsPrimaryKey < ActiveRecord::Migration
  def change
    add_column :enrollment, :id, :primary_key
  end
end
