class Staff < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :department
  belongs_to :user
  has_many :academic_records, inverse_of: :staff
  accepts_nested_attributes_for :academic_records

  validates_presence_of :first_name, :last_name, :gender, :staff_category_id, :staff_department_id

  # validates_uniqueness_of :staff_id, :email

end
