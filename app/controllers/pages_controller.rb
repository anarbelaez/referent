class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @referents = User.referents.last(6)
    @products = Product.all.last(24)

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
