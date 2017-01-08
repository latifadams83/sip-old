class Guardian < ApplicationRecord
  belongs_to :user
  has_many :students

  validates_presence_of :first_name, :last_name, :address, :city, :region
end
