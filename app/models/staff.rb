class Staff < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :user
end
