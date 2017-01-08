module GuardiansHelper

  def guardian_wards(guardian)
    students = guardian.students

    students.each do |s|
      link_to "#{s.last_name}", admin_student_path(s)
    end
  end
end
