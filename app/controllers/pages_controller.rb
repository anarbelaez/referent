class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @referents = User.referent
    @products = Product.available
  end

  def search
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    end
  end
end
