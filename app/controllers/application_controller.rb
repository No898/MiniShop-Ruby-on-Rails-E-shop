class ApplicationController < ActionController::Base
  include CurrentCart
  include Pagy::Backend

  before_action :set_cart
  around_action :switch_locale

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
