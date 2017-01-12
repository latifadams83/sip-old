require 'test_helper'

class AcademicRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_record = academic_records(:one)
  end

  test "should get index" do
    get academic_records_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_record_url
    assert_response :success
  end

  test "should create academic_record" do
    assert_difference('AcademicRecord.count') do
      post academic_records_url, params: { academic_record: { cert_earned: @academic_record.cert_earned, duration: @academic_record.duration, institution: @academic_record.institution, type: @academic_record.type } }
    end

    assert_redirected_to academic_record_url(AcademicRecord.last)
  end

  test "should show academic_record" do
    get academic_record_url(@academic_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_record_url(@academic_record)
    assert_response :success
  end

  test "should update academic_record" do
    patch academic_record_url(@academic_record), params: { academic_record: { cert_earned: @academic_record.cert_earned, duration: @academic_record.duration, institution: @academic_record.institution, type: @academic_record.type } }
    assert_redirected_to academic_record_url(@academic_record)
  end

  test "should destroy academic_record" do
    assert_difference('AcademicRecord.count', -1) do
      delete academic_record_url(@academic_record)
    end

    assert_redirected_to academic_records_url
  end
end
