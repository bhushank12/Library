class BookCopy < ApplicationRecord
  validates :reg_number, presence: true
  belongs_to :book
  has_many :order_details
end
