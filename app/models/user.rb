class User < ApplicationRecord
  has_many :staffs
  has_many :students
  has_many :guardians
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
