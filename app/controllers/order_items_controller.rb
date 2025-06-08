class OrderItemsController < ApplicationController
  before_action :set_cart, only: [:create]
  before_action :set_order_item, only: [:update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @order_item = @cart.add_product(product)

    if @order_item.save
      redirect_to cart_path, notice: "Produkt byl přidán do košíku."
    else
      redirect_to product_path(product), alert: "Produkt se nepodařilo přidat do košíku."
    end
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to cart_path, notice: 'Počet kusů byl upraven.'
    else
      render 'carts/show'
    end
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path, notice: 'Položka byla z košíku odstraněna.'
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end
