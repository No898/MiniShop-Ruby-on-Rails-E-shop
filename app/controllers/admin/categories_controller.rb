class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /admin/categories
  def index
    @categories = Category.all
  end

  # GET /admin/categories/1
  def show
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: "Kategorie byla úspěšně vytvořena."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/categories/1
  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Kategorie byla úspěšně upravena."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/categories/1
  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: "Kategorie byla úspěšně smazána."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
