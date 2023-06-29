class User < ApplicationRecord
	validates :name, :contact_integer, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :contact_integer, length: {minimum: 10}
end
