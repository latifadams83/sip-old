class Level < ApplicationRecord
  has_many :badges

  validates_presence_of :name, :lev
end
