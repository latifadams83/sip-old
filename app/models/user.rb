class User < ApplicationRecord
  has_many :staffs
  has_many :students
  has_many :guardians

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_format_of :email, with: EMAIL_REGEX
end
