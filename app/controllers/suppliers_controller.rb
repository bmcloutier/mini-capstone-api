class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render template: "suppliers/index"
  end
end
