class UpdateColumnValues < ActiveRecord::Migration
  def change
    Enrollment.connection.schema_cache.clear!
    Enrollment.reset_column_information

    Enrollment.all.each do |e|
      e.update_attribute(:enrollment_state_id, EnrollmentState.find_by(stateId: e.status).id)
    end
  end
end
