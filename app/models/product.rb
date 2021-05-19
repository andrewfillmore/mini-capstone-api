class Product < ApplicationRecord
  
  belongs_to :supplier
  
  def supplier_name
    supplier.name
    
  end
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :description, length: {in: 5..500}
  validates :total_inventory, numericality: {greater_than_or_equal_to: 0}
  def is_discounted?
    price < 400
  end

  def tax
    price * 0.09
    
  end

  def total
    price + tax
    
  end
end
