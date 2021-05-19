class ProductsController < ApplicationController
  def index
    products = Product.where("name iLIKE ?" , "#{params[:search]}%")
    render json: products
    
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
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
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
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
