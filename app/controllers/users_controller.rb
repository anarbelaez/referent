class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @referents = User.referent
  end

  def new_referent
    @user = current_user
  end

  def create_referent
    user = User.find(params[:id])
    user.update_attribute(:role, 1)
    user.update(user_params)
    redirect_to home_path
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

  private

  def user_params
    params.require(:user).permit(:brand, :description)
  end
end
