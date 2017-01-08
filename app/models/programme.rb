class Programme < ApplicationRecord
  has_many :badges
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code
end
