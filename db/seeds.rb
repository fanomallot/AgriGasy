# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# creation table region

10.times do
	region =Region.create(place: Faker::Address.country) 
end 

#creation table user
10.times do
	mail = Faker::Name.first_name + Faker::Name.last_name + '@gmail.com'
	user = User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name,
	age: rand(18..67) , ville: Faker::Address.city , contact: Faker::PhoneNumber.phone_number,
	 description: Faker::Books::Lovecraft.paragraph , email: mail,
    password:'password', region_id: rand(1..10)) 
	if (user.id == 1)
		user.update(is_admin: true)
	else
		user.update(is_admin:false)
	end
end 

#creation produit fake
10.times do
	prod =Produit.create(name: Faker::Food.fruits)
end

# creation achat fake
10.times do 
	
	achat = Achat.create(nom: Faker::Food.fruits, date: Faker::Date.forward(days: rand(10..19)),
	description: Faker::Food.description,quantite: rand(100..500),prix: rand(1000..3000),
	lieu: Faker::Address.city, user_id: rand(1..10),region_id:rand(1..10), produit_id:rand(1..10))
	i+=1
	puts i 
end 

# creation vente fake
10.times do 
	vente = Vente.create(nom: Faker::Food.fruits, date: Faker::Date.forward(days: rand(10..19)),
	description: Faker::Food.description,quantite: rand(100..500),prix: rand(1000..3000), lieu: Faker::Address.city, user_id: rand(1..10),
	region_id:rand(1..10), produit_id:rand(1..10))
end 

