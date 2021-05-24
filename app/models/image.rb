class Image < ApplicationRecord
  belongs_to :product #single object of product data
  validates_format_of :url, :with => %r{\.(png|jpg|jpeg|gif)$}i, :message => "must have a valid file type", :multiline => true
end
