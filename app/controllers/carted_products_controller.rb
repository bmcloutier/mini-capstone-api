class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
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
      user_id: params[:user_id],
      order_id: params[:order_id],
      status: params[:status],
    )
    render :show
  end

  def update
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(
      quantity: params[:quantity] || @carted_product.quantity,
      product_id: params[:product_id] || @carted_product.product_id,
      user_id: params[:user_id] || @carted_product.user_id,
      order_id: params[:order_id] || @carted_product.order_id,
      status: params[:status] || @carted_product.status,
    )
    render :show
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    render json: { message: "Carted Product Destroyed!" }
  end
end
