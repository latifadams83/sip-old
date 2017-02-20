class Programme < ApplicationRecord
  has_many :badges
  has_many :students
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code
end
