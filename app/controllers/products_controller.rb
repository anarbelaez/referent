class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # Los visitantes pueden ver los productos y ver el detalle del producto
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.available
  end

  def show
  end

  def new
    redirect_to home_path unless current_user.referent?
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    # @product.status = false
    @product.save
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to user_path(current_user) unless current_user == @product.user
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :user_id, :size, :color, :category, :genre, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
