class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
    @referents = User.referent
    @products = Product.available
  end

  def search
    if params[:query].present?
      @products = Product.search(params[:query]).available
    else
      @products = Product.available
    end
  end
end
