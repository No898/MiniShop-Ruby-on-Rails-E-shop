require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "should have many products" do
    category = Category.new
    assert_respond_to category, :products, "Category does not have a products association"
  end
end
