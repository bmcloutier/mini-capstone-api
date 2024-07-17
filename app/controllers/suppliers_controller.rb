class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render template: "suppliers/index"
  end

  def create
    @supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if @supplier.valid?
      render :show, status: 200
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end
end
