class Staff < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :department
  belongs_to :user
  has_many :academic_records
  accepts_nested_attributes_for :academic_records

  scope :current, lambda {where(:status => 'current')}
  scope :past, lambda {where(["status <> ?", "current"])}

  validates_presence_of :first_name, :last_name, :gender, :staff_category_id, :staff_department_id
  validates_uniqueness_of :staff_id, :email

  def full_name
    self.first_name + " " + self.last_name
  end

  def self.search(keyword)
    if keyword.present?
      Staff.where("status = 'current' AND first_name LIKE ?", "%#{keyword}%")
    else
      return Staff.where("status = 'current'")
    end
  end

end
