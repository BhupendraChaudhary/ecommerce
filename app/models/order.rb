class Order < ActiveRecord::Base
	belongs_to :product
	validates :email, :first_name, :last_name, :zip, presence: true
	validates :first_name, :last_name, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
	validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "not valid"}
	validates :zip, length: {in: 5..6 }
	validates :zip, numericality: {only_integer: true}
	def full_name
		self.first_name + " " + self.last_name
	end
end