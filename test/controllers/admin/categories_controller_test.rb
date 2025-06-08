require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:two) # Fixture for admin user
    @regular_user = users(:one) # Fixture for regular user
    @category = categories(:one)
  end

  # --- Access Control Tests ---

  test "should redirect if not logged in" do
    get admin_categories_url
    assert_redirected_to new_user_session_url # Devise redirects to login page
  end

  test "should redirect if logged in as non-admin" do
    sign_in @regular_user
    get admin_categories_url
    assert_redirected_to root_path
  end

  # --- Admin CRUD Tests ---

  test "should get index when logged in as admin" do
    sign_in @admin_user
    get admin_categories_url
    assert_response :success
  end

  test "should get new when logged in as admin" do
    sign_in @admin_user
    get new_admin_category_url
    assert_response :success
  end

  test "should create category when logged in as admin" do
    sign_in @admin_user
    assert_difference("Category.count") do
      post admin_categories_url, params: { category: { name: "Nová kategorie", description: "Popis" } }
    end
    assert_redirected_to admin_categories_url
  end

  test "should show category when logged in as admin" do
    sign_in @admin_user
    get admin_category_url(@category)
    assert_response :success
  end

  test "should get edit when logged in as admin" do
    sign_in @admin_user
    get edit_admin_category_url(@category)
    assert_response :success
  end

  test "should update category when logged in as admin" do
    sign_in @admin_user
    patch admin_category_url(@category), params: { category: { name: "Upravený název" } }
    assert_redirected_to admin_categories_url
    @category.reload
    assert_equal "Upravený název", @category.name
  end

  test "should destroy category when logged in as admin" do
    sign_in @admin_user
    assert_difference("Category.count", -1) do
      delete admin_category_url(@category)
    end
    assert_redirected_to admin_categories_url
  end
end
