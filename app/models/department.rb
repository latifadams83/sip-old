class Department < ApplicationRecord
  belongs_to :category
  has_many :staffs
  
end
