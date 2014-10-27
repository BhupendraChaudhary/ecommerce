# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{name: "Bike"}, {name: "Car"}, {name: "Computer & Electronic"}, {name: "Mobiles"},
				 {name: "Home Product"}])
Brand.create([{name: "TVS", category_id: 1}, {name: "Hero", category_id: 1}, {name:"Yamaha", category_id: 1},
				{name: "Bajaj", category_id: 1}, {name: "Maruti", category_id: 2}, {name: "Honda", category_id: 2},
				{name: "Hundai", category_id: 2}, {name: "Tata", category_id: 2}, {name: "Ford", category_id: 2},
				{name: "Mahindra", category_id: 2}, {name: "Dell", category_id: 3}, {name: "HP", category_id: 3},
				{name: "Sony", category_id: 3}, {name: "Lenovo", category_id: 3}, {name: "HCL", category_id: 3},
				{name: "Toshiba", category_id: 3}, {name: "Samsung", category_id: 3}, {name: "LG", category_id: 3},
				{name: "Videocon", category_id: 3}, {name: "Micromax", category_id: 4}, {name: "Nokia", category_id: 4},
				{name: "Sony Ericson", category_id: 4},	{name: "Apple", category_id: 4}, {name: "Lux", category_id: 5}, 
				{name: "Dabur", category_id: 5}, {name: "Pepsodent", category_id: 5}, {name: "Colgate", category_id: 5},
				{name: "Samsung", category_id: 5}, {name: "LG", category_id: 5}, {name: "Videocon", category_id: 5}])