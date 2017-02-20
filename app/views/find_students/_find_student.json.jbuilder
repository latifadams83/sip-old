json.extract! find_student, :id, :first_name, :last_name, :student_id, :programme_id, :level_id, :badge_id, :status, :created_at, :updated_at
json.url find_student_url(find_student, format: :json)