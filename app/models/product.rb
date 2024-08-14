class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  has_many :images
  # has_many :orders # Removed when added cart functionality
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  belongs_to :supplier #Shortcut for below method
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end

  def primary_image_url
    if images.length > 0
      images[0].url
    else
      "https://www.svgrepo.com/show/508699/landscape-placeholder.svg"
    end
  end
end
