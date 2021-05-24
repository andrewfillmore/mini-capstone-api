class OrderSerializer < ActiveModel::Serializer
  attributes :id, :product, :tax, :subtotal, :total
end
