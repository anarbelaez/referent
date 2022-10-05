class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @referents = User.referent
    @products = Product.available

    search = params[:root]
    if search.present?
      if search[:filter] == "products"
        @products = Product.where("name LIKE ?", "%#{params[:root][:query]}%")
      else
        @referents = User.where(brand: params[:root][:query])
      end
    end
  end
end
