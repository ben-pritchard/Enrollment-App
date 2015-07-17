class Enrollment < ActiveRecord::Base
  auditable only: [:enrollment_state_id], on: [:update]

  belongs_to :enrollment_state
  belongs_to :project
  belongs_to :eligibility_state
  belongs_to :eligibility_sub_state

  validates :subjId, presence: true, numericality: { only_integer: true }
  validates :homeId, presence: true, numericality: { only_integer: true }

  scope :active, -> { where(enrollment_state_id: 9) }
  scope :screening, -> { where(enrollment_state_id: 3) }

  def get_initial_status
    # The Espinita gem (which tracks updates to enrollment status) counts the
    # initial update that took place in the migration as the first update. Thus
    # we need to account for this when displaying the updates on the
    # Enrollment Status History table on the Enrollment show page

    audits = self.audits.to_a
    if audits.any?
      if audits.first.audited_changes.first[1][0] == nil
        EnrollmentState.find(audits.first.audited_changes.first[1][1]).Name
      else
        EnrollmentState.find(self.audits.first.audited_changes.first[1][0]).Name
      end
    else
      EnrollmentState.find(self.enrollment_state_id).Name
    end
  end

  def get_audits
    audits = self.audits.to_a
    if audits.any?
      if audits.first.audited_changes.first[1][0] == nil
        audits.shift
      end
    end
    audits
  end
end
