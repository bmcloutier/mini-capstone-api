class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    render :show
  end

  def show
    # @product = Product.find_by(id: params["id"])
    @product = Product.find_by(id: params[:id]) #Uses symbol instead of string per shortcut/convention
    render template: "products/show"
  end
end
