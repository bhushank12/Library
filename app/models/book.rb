class Book < ApplicationRecord
  belongs_to :library
  has_many :book_copy
  has_many :order_detail
end
