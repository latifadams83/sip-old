class Student < ApplicationRecord
  belongs_to :guardian

  mount_uploader :image, ImageUploader
end
