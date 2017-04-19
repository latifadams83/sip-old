class User < ApplicationRecord
  belongs_to :role
  has_many :staffs
  has_many :students
  has_many :guardians

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role_id
end
