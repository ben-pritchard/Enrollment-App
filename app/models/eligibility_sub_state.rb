class EligibilitySubState < ActiveRecord::Base
  belongs_to :eligibility_state
  has_many :enrollments

  validates :StateId, presence: true
  validates :SubStateId, presence: true
  validates :Title, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["Title"] + _ransackers.keys
  end
end
