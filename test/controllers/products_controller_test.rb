require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
    assert_select "h1", @product.name
  end

  # test "the truth" do
  #   assert true
  # end
end
