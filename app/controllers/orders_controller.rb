class OrdersController < ApplicationController
  def create
    if current_user != nil
      @order = Order.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total],
      )
      render json: { message: "created successfully" }
    else
      render json: { message: "You can't create orders if not logged in!" }
    end
  end

  def index
    if current_user != nil
      @orders = Order.where(user_id: current_user.id)
      render :index
    else
      render json: { message: "You must be logged in to see orders!" }
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user != nil && @order.user_id == current_user.id
      render :show
    else
      render json: { message: "You can't view orders that aren't yours!" }
    end
  end
end
