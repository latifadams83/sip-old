require 'test_helper'

class StaffDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_department = staff_departments(:one)
  end

  test "should get index" do
    get staff_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_department_url
    assert_response :success
  end

  test "should create staff_department" do
    assert_difference('StaffDepartment.count') do
      post staff_departments_url, params: { staff_department: { name: @staff_department.name, staff_category_id: @staff_department.staff_category_id } }
    end

    assert_redirected_to staff_department_url(StaffDepartment.last)
  end

  test "should show staff_department" do
    get staff_department_url(@staff_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_department_url(@staff_department)
    assert_response :success
  end

  test "should update staff_department" do
    patch staff_department_url(@staff_department), params: { staff_department: { name: @staff_department.name, staff_category_id: @staff_department.staff_category_id } }
    assert_redirected_to staff_department_url(@staff_department)
  end

  test "should destroy staff_department" do
    assert_difference('StaffDepartment.count', -1) do
      delete staff_department_url(@staff_department)
    end

    assert_redirected_to staff_departments_url
  end
end
