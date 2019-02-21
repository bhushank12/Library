class User < ApplicationRecord

	belongs_to :library, optional: true
	has_many :order_details

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable, 
         :recoverable, :rememberable, :validatable
end
