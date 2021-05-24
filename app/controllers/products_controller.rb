class ProductsController < ApplicationController
  
  before_action :authenticate_admin, except: [:index, :show]

  def index
    products = Product.all
    if params[:category]
      category = Category.find_by("name iLIKE ?", params[:category])
      product = category.products
    end
    render json: products.category
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
      quantity: params[:quantity]
    )
    if product.save
      if params[:url]
        Image.create(
          url: params[:url],
          product_id: product.id
        )
      end
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
