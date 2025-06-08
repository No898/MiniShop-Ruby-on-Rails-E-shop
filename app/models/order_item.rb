class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order, inverse_of: :order_items

  after_initialize :set_default_quantity, if: :new_record?

  def subtotal
    product.price * quantity
  end

  private

  def set_default_quantity
    self.quantity ||= 1
  end
end
