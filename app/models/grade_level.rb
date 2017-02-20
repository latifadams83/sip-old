class GradeLevel < ApplicationRecord
  has_many :students
  has_many :badges

  validates_presence_of :name, :level
end
