class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :order_detail
end
