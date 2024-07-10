class ProductsController < ApplicationController
  def all_products_method
    products = Product.all
    render json: { products: products }
  end

  def single_product_method
    product = Product.first
    render json: { name: product["name"], price: product["price"], image_url: product["image_url"], description: product["description"] }
  end
end
