class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @cart.reload
    @order_items = @cart.order_items.includes(:product).order(:created_at)
  end
end
