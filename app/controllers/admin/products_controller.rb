class Admin::ProductsController < Admin::AdminController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :load_categories, only: %i[ new edit create update ]

  # GET /admin/products
  def index
    @products = Product.all
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Produkt byl úspěšně vytvořen."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Produkt byl úspěšně upraven."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/products/1
  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "Produkt byl úspěšně smazán."
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end

    def load_categories
      @categories = Category.all.order(:name)
    end
end
