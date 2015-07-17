class Project < ActiveRecord::Base
  has_many :enrollments

  validates :projectId, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :mask, presence: true
  validates :active, presence: true
end
