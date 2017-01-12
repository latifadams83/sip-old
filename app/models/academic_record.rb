class AcademicRecord < ApplicationRecord
  belongs_to :staff, inverse_of: :academic_record
end
