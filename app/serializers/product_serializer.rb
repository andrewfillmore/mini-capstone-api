class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :description, :tax, :is_discounted?, :total
end
