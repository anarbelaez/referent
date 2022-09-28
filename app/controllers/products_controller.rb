class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = product.create(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy

    redirect_to products_path, status: :see_other
  end


end
