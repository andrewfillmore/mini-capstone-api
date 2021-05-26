class CartedProductsController < ApplicationController
  
  def index
    carted_products = current_user.carted_products(
      status: params[:status]
    )
    render json: carted_products.status
    
  end
  
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status]
    )
    carted_product.save
    render json: carted_product
    
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.delete
    render json: {message: "Your item has been deleted."}
    
  end
end
