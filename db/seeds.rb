# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(name: "Test", email: "test@example.com", password: "password", admin: true)

Supplier.create!(name: "Acme", email: "info@acme.com", phone_number: "123-456-7890")
Supplier.create!(name: "Beta", email: "info@beta.net", phone_number: "234-567-8901")

Product.create!(name: "Widget", price: 5, description: "The world's best thingy!", supplier_id: 1)
Product.create!(name: "Desk", price: 60, description: "A place to set your favorite widget!", supplier_id: 1)
Product.create!(name: "Chair", price: 35, description: "Sit at your desk in comfort!", supplier_id: 2)

Image.create!(url: "https://openclipart.org/image/800px/181902", product_id: 1)
Image.create!(url: "https://openclipart.org/image/800px/293593", product_id: 1)
Image.create!(url: "https://openclipart.org/image/800px/58447", product_id: 2)
Image.create!(url: "https://openclipart.org/image/800px/265857", product_id: 3)

Category.create!(name: "Office")
Category.create!(name: "Kitchen")
Category.create!(name: "Bedroom")
Category.create!(name: "Bathroom")
Category.create!(name: "Dining")

CategoryProduct.create!(category_id: 1, product_id: 1)
CategoryProduct.create!(category_id: 2, product_id: 1)
CategoryProduct.create!(category_id: 1, product_id: 2)
CategoryProduct.create!(category_id: 1, product_id: 3)
CategoryProduct.create!(category_id: 3, product_id: 3)
CategoryProduct.create!(category_id: 5, product_id: 3)

Order.create!(user_id: 1, subtotal: 10, tax: 1, total: 11)

CartedProduct.create!(quantity: 5, product_id: 1, user_id: 1, order_id: 1, status: "purchased")
CartedProduct.create!(quantity: 2, product_id: 3, user_id: 1, status: "carted")
