class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
    
  end

  def create
    if current_user
      product = Product.new({
        name: params[:name],
        price: params[:price],
        description: params[:description],
        supplier_id: params[:supplier_id],
        total_inventory: params[:total_inventory],
        user_id: current_user.id
      })
      if product.save
        render json: product
      else
        render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to do that"}, status: :unauthorized
    end
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.supplier_id = params[:supplier_id] || product.supplier_id
    product.total_inventory = params[:total_inventory] || product.total_inventory
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    product = Product.find(params[:id])
    product.delete
    render json: {message: "Your item has been deleted."}
    
  end
end
