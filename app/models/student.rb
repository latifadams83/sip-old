class Student < ApplicationRecord
  belongs_to :user
  belongs_to :guardian
  mount_uploader :image, ImageUploader
end
