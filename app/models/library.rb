class Library < ApplicationRecord
	has_many :users
	has_many :books
end
