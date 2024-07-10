class ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render template: "products/index"
  end

  def single_product_method
    @product = Product.first
    render template: "products/show"
  end
end
