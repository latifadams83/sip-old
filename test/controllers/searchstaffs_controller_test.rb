require 'test_helper'

class SearchstaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get searchstaffs_new_url
    assert_response :success
  end

  test "should get show" do
    get searchstaffs_show_url
    assert_response :success
  end

end
