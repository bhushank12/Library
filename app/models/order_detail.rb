class OrderDetail < ApplicationRecord
  belongs_to :book
  belongs_to :book_copy
  belongs_to :user
end
