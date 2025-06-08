class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
    # Z bezpečnostních důvodů ověříme, že se uživatel dívá jen na své objednávky
    redirect_to root_path, alert: "Nemáte oprávnění k zobrazení této stránky." unless @order.user == current_user || current_user.admin?
  end

  def new
    if @cart.order_items.empty?
      redirect_to root_path, notice: "Váš košík je prázdný."
      return
    end
    @order = @cart
  end

  def create
    @order = @cart
    @order.assign_attributes(order_params)
    @order.status = 'pending' # Nebo 'processing'
    @order.user = current_user

    if @order.save
      OrderMailer.with(order: @order).confirmation.deliver_later
      session.delete(:cart_id)
      # Zde by se v reálu poslal email, spustila platba atd.
      redirect_to @order, notice: 'Děkujeme za vaši objednávku!'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
