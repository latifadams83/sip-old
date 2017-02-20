class Guardian < ApplicationRecord
  belongs_to :user
  has_one :student

  validates_presence_of :first_name, :last_name, :address, :city, :region

  def full_name
    self.first_name + " " + self.last_name
  end

  def ward_name
    self.student.last_name + " " + self.student.first_name
  end
end
