require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { address: @student.address, badge_id: @student.badge_id, city: @student.city, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, gender: @student.gender, guardian_id: @student.guardian_id, last_name: @student.last_name, level_id: @student.level_id, phone: @student.phone, placed_date: @student.placed_date, placed_id: @student.placed_id, programme_id: @student.programme_id, region: @student.region, religion: @student.religion, user_id: @student.user_id } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, badge_id: @student.badge_id, city: @student.city, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, gender: @student.gender, guardian_id: @student.guardian_id, last_name: @student.last_name, level_id: @student.level_id, phone: @student.phone, placed_date: @student.placed_date, placed_id: @student.placed_id, programme_id: @student.programme_id, region: @student.region, religion: @student.religion, user_id: @student.user_id } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
