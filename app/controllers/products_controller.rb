class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
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
      Image.create(product_id: @product.id, url: params[:image_url])
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
