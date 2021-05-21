class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :tax, :is_discounted?, :total, :supplier, :images
end
