require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:two)
    @regular_user = users(:one)
    @product = products(:one)
    @category = categories(:one)
  end

  # --- Access Control Tests ---

  test "should redirect if not logged in" do
    get admin_products_url
    assert_redirected_to new_user_session_url
  end

  test "should redirect if logged in as non-admin" do
    sign_in @regular_user
    get admin_products_url
    assert_redirected_to root_path
  end

  # --- Admin CRUD Tests ---

  test "should get index when logged in as admin" do
    sign_in @admin_user
    get admin_products_url
    assert_response :success
  end

  test "should get new when logged in as admin" do
    sign_in @admin_user
    get new_admin_product_url
    assert_response :success
  end

  test "should create product when logged in as admin" do
    sign_in @admin_user
    assert_difference("Product.count") do
      post admin_products_url, params: { product: { name: "Nový produkt", description: "Popis", price: 100, category_id: @category.id } }
    end
    assert_redirected_to admin_products_url
  end

  test "should show product when logged in as admin" do
    sign_in @admin_user
    get admin_product_url(@product)
    assert_response :success
  end

  test "should get edit when logged in as admin" do
    sign_in @admin_user
    get edit_admin_product_url(@product)
    assert_response :success
  end

  test "should update product when logged in as admin" do
    sign_in @admin_user
    patch admin_product_url(@product), params: { product: { name: "Upravený produkt" } }
    assert_redirected_to admin_products_url
    @product.reload
    assert_equal "Upravený produkt", @product.name
  end

  test "should destroy product when logged in as admin" do
    sign_in @admin_user
    assert_difference("Product.count", -1) do
      delete admin_product_url(@product)
    end
    assert_redirected_to admin_products_url
  end
end
