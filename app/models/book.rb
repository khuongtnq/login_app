class Book < ApplicationRecord
  before_save {self.author = author.downcase }
  validates :name, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
