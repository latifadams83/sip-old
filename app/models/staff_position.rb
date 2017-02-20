class StaffPosition < ApplicationRecord
  belongs_to :staff_category
  has_many :staffs
  validates_presence_of :name
  validates_uniqueness_of :name
end
