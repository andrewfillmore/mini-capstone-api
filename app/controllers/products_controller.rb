class ProductsController < ApplicationController
  def all_product_method
    render json: Product.all
  end
  
  def first_product_method
    render json: Product.find_by(id:1)
  end
end
