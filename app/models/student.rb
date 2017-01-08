class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :guardian

  validates_presence_of :placed_id, :placed_date, :first_name, :last_name, :gender, :date_of_birth, :programme_id, :badge_id

  validates_uniqueness_of :placed_id
end
