class Supplier < ApplicationRecord
  has_many :products #Shortcut for below method
  # def products
  #   Product.where(supplier_id: self.id)
  # end
end
