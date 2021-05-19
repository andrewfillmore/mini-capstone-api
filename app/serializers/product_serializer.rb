class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :images, :description, :tax, :is_discounted?, :total, :supplier
end
