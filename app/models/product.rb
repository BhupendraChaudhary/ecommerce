class Product < ActiveRecord::Base
	has_many :product_images, dependent: :destroy
	has_many :orders
	belongs_to :brands
	belongs_to :category
	belongs_to :user
	validates :name, :price, :quantity, presence: true
	validates :name, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
end
