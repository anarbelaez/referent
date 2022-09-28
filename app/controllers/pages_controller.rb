class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @referents = User.where(role: true)
    @products = Product.all

    # En proceso

    # "root"=>{"filter"=>"products", "query"=>"dell"
    # if params[:root].present?
    #   if params[:root][:filter] == "products"
    #     @objects = Product.where("name LIKE ?", "%#{params[:root][:query]}%")
    #   elsif params[:root][:filter] == "referents"
    #     @objects = User.where(brand: params[:root][:query])
    #   end
    # else
    #   @objects = User.where(role: true)
    # end
  end
end
