class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # Los visitantes pueden ver los productos y ver el detalle del producto
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    redirect_to home_path, notice: "You aren't a Referent!" unless current_user.referent?
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to user_path(current_user), notice: "Hey, hey hey" unless current_user.id.to_i == @product.user_id
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
    params.require(:product).permit(:name, :description, :price, :user_id, :size, :color, :category, :genre)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
