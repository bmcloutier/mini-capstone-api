class ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render template: "products/index"
  end

  def single_product_method
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def widget_method
    @product = Product.find_by(name: "Widget")
    render template: "products/show"
  end

  def desk_method
    @product = Product.find_by(name: "Desk")
    render template: "products/show"
  end
end
