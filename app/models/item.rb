class Item < ApplicationRecord
  scope :available, -> {where(in_stock: true)}
  scope :cheap, -> { where(price: 0..1) }
  scope :cheap_than, -> (price) {
    where("price < ?", price) }
  validates :name,
            presence: true,
            if: Proc.new { |a| a.weight == 1600 }

end
