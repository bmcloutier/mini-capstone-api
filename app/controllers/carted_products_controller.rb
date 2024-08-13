class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render :show
  end

  def create
    @carted_product = CartedProduct.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: current_user.id,
      order_id: params[:order_id],
      status: "carted",
    )
    render :show
  end

  def update
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(
      quantity: params[:quantity] || @carted_product.quantity,
      product_id: params[:product_id] || @carted_product.product_id,
      user_id: current_user.id || @carted_product.user_id,
      order_id: params[:order_id] || @carted_product.order_id,
      status: params[:status] || @carted_product.status,
    )
    render :show
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id], user_id: current_user.id)
    @carted_product.update(
      status: "removed",
    )
    render json: { message: "Carted Product Destroyed, wink wink!" }
  end
end
