class Badge < ApplicationRecord
  belongs_to :level

  validates_presence_of :name, :programme_id, :level_id, :start_date, :end_date, :active
end
