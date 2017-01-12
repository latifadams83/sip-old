class User < ApplicationRecord

  has_secure_password

  has_many :staffs
  has_many :students
  has_many :guardians

  validates_presence_of :email
end
