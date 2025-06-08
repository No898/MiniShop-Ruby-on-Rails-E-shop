require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:two)
    @regular_user = users(:one)
  end

  test "should redirect if not logged in" do
    get admin_root_url
    assert_redirected_to new_user_session_url
  end

  test "should redirect if logged in as non-admin" do
    sign_in @regular_user
    get admin_root_url
    assert_redirected_to root_path
  end

  test "should get index when logged in as admin" do
    sign_in @admin_user
    get admin_root_url
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
