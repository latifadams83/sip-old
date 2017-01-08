class StaffDepartment < ApplicationRecord
  belongs_to :staff_category

  validates_presence_of :name
  validates_uniqueness_of :name
end
