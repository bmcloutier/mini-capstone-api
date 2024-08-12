class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :product # Removed when added cart functionality
  has_many :products, through: :carted_products
end
