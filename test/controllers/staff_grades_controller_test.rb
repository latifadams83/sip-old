require 'test_helper'

class StaffGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_grade = staff_grades(:one)
  end

  test "should get index" do
    get staff_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_grade_url
    assert_response :success
  end

  test "should create staff_grade" do
    assert_difference('StaffGrade.count') do
      post staff_grades_url, params: { staff_grade: { name: @staff_grade.name, staff_category_id: @staff_grade.staff_category_id } }
    end

    assert_redirected_to staff_grade_url(StaffGrade.last)
  end

  test "should show staff_grade" do
    get staff_grade_url(@staff_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_grade_url(@staff_grade)
    assert_response :success
  end

  test "should update staff_grade" do
    patch staff_grade_url(@staff_grade), params: { staff_grade: { name: @staff_grade.name, staff_category_id: @staff_grade.staff_category_id } }
    assert_redirected_to staff_grade_url(@staff_grade)
  end

  test "should destroy staff_grade" do
    assert_difference('StaffGrade.count', -1) do
      delete staff_grade_url(@staff_grade)
    end

    assert_redirected_to staff_grades_url
  end
end
