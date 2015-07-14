class UpdateColumnValues < ActiveRecord::Migration
  def change
    Enrollment.connection.schema_cache.clear!
    Enrollment.reset_column_information

    Enrollment.all.each do |e|
      e.update(enrollment_state_id: EnrollmentState.find_by(stateId: e.status).id)
      e.update(eligibility_state_id: EligibilityState.find_by(stateId: e.eligibility).id)
      e.update(project_id: Project.find_by(projectId: e.projId).id)
    end
  end
end
