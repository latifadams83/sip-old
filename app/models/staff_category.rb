class StaffCategory < ApplicationRecord
  has_many :staffs
  has_many :staff_departments
  has_many :staff_positions
  has_many :staff_grades

  validates_presence_of :name
  validates_uniqueness_of :name
end
