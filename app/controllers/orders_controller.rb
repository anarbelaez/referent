class OrdersController < ApplicationController
  before_action :set_product, only: %i[new create change_status]

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.product = @product
    @order.save
    if @order.save
      @product.mark_as_sold!
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order = Order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  def close_order
    order = Order.find(params[:order_id])
    order.mark_as_closed!
    redirect_to order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :current_user, :payment, :delivery, :status)
  end

  def status_params
    params.require(:order).permit(:status)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
