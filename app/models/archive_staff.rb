class ArchiveStaff < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :department
  belongs_to :user

  validates_presence_of :first_name, :last_name, :gender, :qualification, :staff_category_id, :staff_department_id

  validates_uniqueness_of :staff_id, :email
end
