class Category < ApplicationRecord
  has_many :departments
  has_many :staffs
  
end
