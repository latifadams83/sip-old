class StaffCategory < ApplicationRecord
  has_many :staffs
  has_many :staff_departments
  has_many :staff_positions
  has_many :staff_grades
end
