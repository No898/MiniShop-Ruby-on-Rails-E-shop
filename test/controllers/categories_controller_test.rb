require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
    assert_select "h1", "Kategorie produktů"
    assert_select "h2", categories(:one).name
    assert_select "h2", categories(:two).name
  end

  test "should show category and its products" do
    get category_url(@category)
    assert_response :success
    assert_select "h1", @category.name
    assert_select "h3", @category.products.first.name
  end

  # test "the truth" do
  #   assert true
  # end
end
