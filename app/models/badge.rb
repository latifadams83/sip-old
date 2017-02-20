class Badge < ApplicationRecord
  belongs_to :programme
  belongs_to :grade_level
  validates_presence_of :name, :programme_id, :grade_level_id, :start_date, :end_date, :active

  def full_name
    self.grade_level.level.to_s + "" + self.name.upcase
  end

  def duration
    self.start_date.year.to_s+"-"+ self.end_date.year.to_s
  end
end
