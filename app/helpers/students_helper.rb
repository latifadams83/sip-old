module StudentsHelper

  def student_guardian(student)
      guardian = Guardian.find(student.guardian_id)
    return guardian.first_name + " " + guardian.last_name
  end
end
