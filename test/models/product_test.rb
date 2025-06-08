require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end

  test "should not save product without name" do
    product = Product.new(description: "d", price: 1, category: @category)
    assert_not product.save, "Saved the product without a name"
  end

  test "should not save product without description" do
    product = Product.new(name: "n", price: 1, category: @category)
    assert_not product.save, "Saved the product without a description"
  end

  test "should not save product without price" do
    product = Product.new(name: "n", description: "d", category: @category)
    assert_not product.save, "Saved the product without a price"
  end

  test "should not save product with negative price" do
    product = Product.new(name: "n", description: "d", price: -1, category: @category)
    assert_not product.save, "Saved the product with a negative price"
  end

  test "should not save product without category" do
    product = Product.new(name: "n", description: "d", price: 1)
    assert_not product.save, "Saved the product without a category"
  end

  # test "the truth" do
  #   assert true
  # end
end
