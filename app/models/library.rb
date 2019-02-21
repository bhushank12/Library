class Library < ApplicationRecord
	validates :name, :location, presence: true
	has_many :users
	has_many :books
end
