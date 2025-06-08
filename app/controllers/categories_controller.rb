class CategoriesController < ApplicationController
  def index
    @categories = Category.left_joins(:products)
                          .group(:id)
                          .select('categories.*, COUNT(products.id) AS products_count')
                          .order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @pagy, @products = pagy(@category.products.order(created_at: :desc))
  end
end
