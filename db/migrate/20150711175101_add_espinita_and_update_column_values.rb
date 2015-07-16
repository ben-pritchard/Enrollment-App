class AddEspinitaAndUpdateColumnValues < ActiveRecord::Migration
  def change
    create_table :espinita_audits do |t|
      t.references :auditable, polymorphic: true, index: true
      t.references :user, polymorphic: true, index: true
      t.text :audited_changes
      t.string :comment
      t.integer :version
      t.string :action
      t.string :remote_address

      t.timestamps
    end

    Enrollment.connection.schema_cache.clear!
    Enrollment.reset_column_information

    Enrollment.all.each do |e|
      e.update(enrollment_state_id: EnrollmentState.find_by(stateId: e.status).id)
      e.update(eligibility_state_id: EligibilityState.find_by(StateId: e.eligibility).id)
      e.update(eligibility_sub_state_id: EligibilitySubState.find_by(SubStateId: e.secondary).id)
      e.update(project_id: Project.find_by(projectId: e.projId).id)
    end

    EligibilitySubState.all.each do |e|
      e.update(eligibility_state_id: EligibilityState.find_by(StateId: e.StateId).id)
    end
  end
end
