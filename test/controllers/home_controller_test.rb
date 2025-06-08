require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index and display products" do
    get root_url
    assert_response :success
    assert_select "h1", "Vítejte v našem MiniShopu!"
    assert_select "h3", products(:one).name
    assert_select "h3", products(:two).name
  end
end
