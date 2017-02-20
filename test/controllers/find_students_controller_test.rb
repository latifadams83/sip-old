require 'test_helper'

class FindStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @find_student = find_students(:one)
  end

  test "should get index" do
    get find_students_url
    assert_response :success
  end

  test "should get new" do
    get new_find_student_url
    assert_response :success
  end

  test "should create find_student" do
    assert_difference('FindStudent.count') do
      post find_students_url, params: { find_student: { badge_id: @find_student.badge_id, first_name: @find_student.first_name, last_name: @find_student.last_name, level_id: @find_student.level_id, programme_id: @find_student.programme_id, status: @find_student.status, student_id: @find_student.student_id } }
    end

    assert_redirected_to find_student_url(FindStudent.last)
  end

  test "should show find_student" do
    get find_student_url(@find_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_find_student_url(@find_student)
    assert_response :success
  end

  test "should update find_student" do
    patch find_student_url(@find_student), params: { find_student: { badge_id: @find_student.badge_id, first_name: @find_student.first_name, last_name: @find_student.last_name, level_id: @find_student.level_id, programme_id: @find_student.programme_id, status: @find_student.status, student_id: @find_student.student_id } }
    assert_redirected_to find_student_url(@find_student)
  end

  test "should destroy find_student" do
    assert_difference('FindStudent.count', -1) do
      delete find_student_url(@find_student)
    end

    assert_redirected_to find_students_url
  end
end
