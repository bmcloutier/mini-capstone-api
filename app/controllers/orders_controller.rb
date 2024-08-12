class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_products = current_user.carted_products
    subtotal = 0
    @carted_products.each { |item|
      if item.status == "carted"
        subtotal += item.product.price * item.quantity
      end
    }
    tax = subtotal * 0.085
    total = subtotal + tax
    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    @carted_products.each { |item|
      if item.status == "carted"
        item.update(
          order_id: @order.id,
          status: "purchased",
        )
      end
    }
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
