class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @referents = User.referents
  end

  def show
    @user = User.find(params[:id])
  end

  def details
    if current_user.id == params[:user_id].to_i
      @products = current_user.products
      @orders = current_user.orders
    else
      redirect_to home_path
    end
  end
end
