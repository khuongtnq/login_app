class Item < ApplicationRecord
  scope :available, -> {where(in_stock: true)}
  scope :cheap, -> { where(price: 0..1) }
  scope :cheap_than, -> (price) {
    where("price < ?", price) }
end
