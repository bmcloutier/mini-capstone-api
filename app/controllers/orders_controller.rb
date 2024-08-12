class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @product = Product.find_by(id: params[:product_id])
    subtotal = @product.price * params[:quantity].to_f
    tax = subtotal * 0.085
    total = subtotal + tax
    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    render :show
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    end
  end
end
