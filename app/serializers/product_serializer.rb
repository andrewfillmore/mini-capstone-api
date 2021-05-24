class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :tax, :is_discounted?, :total 
  
  belongs_to :supplier
  has_many :images
  has_many :categories
end
