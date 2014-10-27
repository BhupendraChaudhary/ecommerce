class Category < ActiveRecord::Base
	has_many :brands
	has_many :products
end