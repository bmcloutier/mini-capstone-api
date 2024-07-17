class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.valid?
      render :show, status: 200
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def show
    # @product = Product.find_by(id: params["id"])
    @product = Product.find_by(id: params[:id]) #Uses symbol instead of string per shortcut/convention
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description,
    )
    if @product.valid?
      render :show, status: 200
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.delete
    render json: { message: "Delete successful" }
  end
end
