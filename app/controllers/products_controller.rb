class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    # @product = Product.find_by(id: params["id"])
    @product = Product.find_by(id: params[:id]) #Uses symbol instead of string per shortcut/convention
    render template: "products/show"
  end
end
