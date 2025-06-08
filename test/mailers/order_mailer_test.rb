require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
    @order.order_items.build(product: products(:one), quantity: 1)
    @order.order_items.build(product: products(:two), quantity: 2)
  end

  test "confirmation" do
    mail = OrderMailer.confirmation(@order)
    
    assert_equal "Potvrzení objednávky č. #{@order.id}", mail.subject
    assert_equal [@order.user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    
    assert_match @order.user.email, mail.html_part.body.encoded
    assert_match @order.user.email, mail.text_part.body.encoded
    
    assert_match "Děkujeme za vaši objednávku!", mail.html_part.body.encoded
    assert_match "Souhrn objednávky", mail.html_part.body.encoded
    
    # Ověříme, že jsou v emailu produkty
    assert_match products(:one).name, mail.html_part.body.encoded
    assert_match products(:two).name, mail.html_part.body.encoded
    assert_match "Celkem:", mail.html_part.body.encoded
  end
end
