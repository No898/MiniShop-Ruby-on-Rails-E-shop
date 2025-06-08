class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @orders = current_user.orders.where.not(status: 'cart').order(created_at: :desc)
  end
end
