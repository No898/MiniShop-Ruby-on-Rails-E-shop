class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy, inverse_of: :order

  validates :address, presence: true, if: :submitting_order?

  def add_product(product)
    current_item = order_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    order_items.sum(&:subtotal)
  end

  def submitting_order?
    status == 'pending'
  end
end
