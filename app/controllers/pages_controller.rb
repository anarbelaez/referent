class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
    @referents = User.referent
    @products = Product.available
  end

  def search
    @results = PgSearch.multisearch(params[:query]) if params[:query].present?
    @referents = User.referent
    @products = Product.available
  end
end
