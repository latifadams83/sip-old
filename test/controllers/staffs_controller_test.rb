require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_url
    assert_response :success
  end

  test "should create staff" do
    assert_difference('Staff.count') do
      post staffs_url, params: { staff: { : @staff., : @staff., active: @staff.active, address: @staff.address, city: @staff.city, date_join: @staff.date_join, date_of_birth: @staff.date_of_birth, date_of_first_appointment: @staff.date_of_first_appointment, email: @staff.email, first_name: @staff.first_name, gender: @staff.gender, grade: @staff.grade, image: @staff.image, job_description: @staff.job_description, marital_status: @staff.marital_status, no_of_children: @staff.no_of_children, qualification: @staff.qualification, region: @staff.region, religion: @staff.religion, specialization: @staff.specialization, spouse_name: @staff.spouse_name, staff_id: @staff.staff_id, user_id: @staff.user_id } }
    end

    assert_redirected_to staff_url(Staff.last)
  end

  test "should show staff" do
    get staff_url(@staff)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_url(@staff)
    assert_response :success
  end

  test "should update staff" do
    patch staff_url(@staff), params: { staff: { : @staff., : @staff., active: @staff.active, address: @staff.address, city: @staff.city, date_join: @staff.date_join, date_of_birth: @staff.date_of_birth, date_of_first_appointment: @staff.date_of_first_appointment, email: @staff.email, first_name: @staff.first_name, gender: @staff.gender, grade: @staff.grade, image: @staff.image, job_description: @staff.job_description, marital_status: @staff.marital_status, no_of_children: @staff.no_of_children, qualification: @staff.qualification, region: @staff.region, religion: @staff.religion, specialization: @staff.specialization, spouse_name: @staff.spouse_name, staff_id: @staff.staff_id, user_id: @staff.user_id } }
    assert_redirected_to staff_url(@staff)
  end

  test "should destroy staff" do
    assert_difference('Staff.count', -1) do
      delete staff_url(@staff)
    end

    assert_redirected_to staffs_url
  end
end
