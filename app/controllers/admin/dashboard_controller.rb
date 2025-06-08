class Admin::DashboardController < Admin::AdminController
  def index
    @product_count = Product.count
    @category_count = Category.count
  end
end
