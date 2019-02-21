class Book < ApplicationRecord
	validates :name, :author, presence: true

  belongs_to :library
  has_many :book_copies
  has_many :order_details
end
