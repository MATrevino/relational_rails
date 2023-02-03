# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CoffeeShop.destroy_all
Drink.destroy_all

#coffee shops
coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false)
coffee_shop_3 = CoffeeShop.create!(name: "Metropolis", open_year: 2002, open_after_five: false)

#drinks

drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
drink_3 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Cold Brew", hot_drink: false, price: 4)

drink_4 = Drink.create!(coffee_shop_id: coffee_shop_2.id, name: "Cappuccino", hot_drink: true, price: 3)
drink_5 = Drink.create!(coffee_shop_id: coffee_shop_2.id, name: "Americano", hot_drink: true, price: 2)
drink_6 = Drink.create!(coffee_shop_id: coffee_shop_2.id, name: "Iced Oat Latte", hot_drink: false, price: 5)

drink_7 = Drink.create!(coffee_shop_id: coffee_shop_3.id, name: "Cold Brew", hot_drink: false, price: 4)
drink_8 = Drink.create!(coffee_shop_id: coffee_shop_3.id, name: "Americano", hot_drink: true, price: 3)
drink_9 = Drink.create!(coffee_shop_id: coffee_shop_3.id, name: "Drip Coffee", hot_drink: true, price: 2)
drink_10 = Drink.create!(coffee_shop_id: coffee_shop_3.id, name: "Espresso shot", hot_drink: true, price: 1.50)
