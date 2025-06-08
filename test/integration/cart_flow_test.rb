require "test_helper"

class CartFlowTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "can see a product page" do
    get product_url(@product)
    assert_response :success
    assert_select "h1", @product.name
  end

  test "can add a product to the cart" do
    # Přejdeme na detail produktu
    get product_url(@product)
    assert_response :success

    # Přidáme produkt do košíku
    assert_difference('OrderItem.count', 1) do
      post order_items_url, params: { product_id: @product.id }
    end

    # Ověříme přesměrování do košíku
    assert_redirected_to cart_url
    follow_redirect!
    assert_response :success

    # Ověříme, že se v košíku zobrazuje správný produkt a zpráva
    assert_select "p.notice", "Produkt byl přidán do košíku."
    assert_select "td", text: @product.name
    # Zkontrolujeme, že v navigační liště je správný počet položek
    assert_select "nav .absolute", "1"
  end

  test "adding an existing product to cart increases quantity" do
    # Nejprve jednou přidáme produkt
    post order_items_url, params: { product_id: @product.id }
    assert_redirected_to cart_url
    
    # Přidáme ho podruhé, počet OrderItem se nesmí změnit
    assert_no_difference('OrderItem.count') do
      post order_items_url, params: { product_id: @product.id }
    end

    follow_redirect!
    assert_response :success
    # Ověříme, že v políčku pro množství je hodnota 2
    assert_select "input[value='2']"
    
    # Ověříme, že v navigační liště je stále počet položek 1 (protože je to 1 typ produktu)
    # Tento test předpokládá, že počítáme unikátní order_items. Což je správně.
    assert_select "nav .absolute", "1" 
  end

  test "can update quantity in cart" do
    # Přidáme produkt a přejdeme do košíku
    post order_items_url, params: { product_id: @product.id }
    follow_redirect!
    
    order_item = OrderItem.find_by(product_id: @product.id)
    
    # Změníme množství na 3
    patch order_item_url(order_item), params: { order_item: { quantity: 3 } }
    assert_redirected_to cart_url
    follow_redirect!
    assert_response :success

    assert_select "p.notice", "Počet kusů byl upraven."
    assert_select "input[value='3']"
  end

  test "can remove an item from the cart" do
    # Přidáme produkt
    post order_items_url, params: { product_id: @product.id }
    order_item = OrderItem.find_by(product_id: @product.id)

    # A hned ho smažeme
    assert_difference('OrderItem.count', -1) do
      delete order_item_url(order_item)
    end

    assert_redirected_to cart_url
    follow_redirect!
    assert_response :success
    assert_select "p.notice", "Položka byla z košíku odstraněna."
    assert_select ".container p", text: "Váš košík je prázdný."
    # Ověříme, že zmizela i ikonka s počtem u košíku v navigaci
    assert_select "nav .absolute", count: 0
  end
end
