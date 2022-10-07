class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
    @referents = User.referent
    @products = Product.available
    # redirect_to user_path(current_user) if user_signed_in? && current_user.referent?
  end

  def search
    if params[:query].present?
      @query = params[:query]
      @products = Product.search(params[:query]).available
    else
      @products = Product.available
    end
  end
end
