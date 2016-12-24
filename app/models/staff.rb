class Staff < ApplicationRecord
  belongs_to :category
  belongs_to :department
  belongs_to :user

  mount_uploader :image, ImageUploader
end
