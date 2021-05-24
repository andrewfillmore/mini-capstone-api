class OrdersController < ApplicationController
  
  def index
    orders = Order.all
    render json: orders
  end

  def create
    order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id
    )
    # subtotal is products price times orders quantity
    order.subtotal = order.quantity * order.product.price
    order.tax = order.subtotal * 0.09
    order.total = order.tax + order.subtotal
    
    if order.save
      render json: order
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
