# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

product = Product.create(name: "Widget", price: 5, image_url: "images/widget.jpg", description: "The world's best thingy!")
product.save

product = Product.create(name: "Desk", price: 60, image_url: "images/desk.jpg", description: "A place to set your favorite widget!")
product.save

product = Product.create(name: "Chair", price: 35, image_url: "images/chair.jpg", description: "Sit at your desk in comfort!")
product.save
