class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

end
