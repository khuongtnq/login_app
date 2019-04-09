# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Robot.create(name: "Gigabit", slogan: "Only my army of killer robots understands me..")
Robot.create(name: "Rob Bitt", slogan: "I am not a simple Computer.")
Robot.create(name: "Screwie", slogan: "I'm still in beta..")
Robot.create(name: "Brobot", slogan: "Optimus Primates RULE!")
Robot.create(name: "Databorg", slogan: "I am borg.")

Item.create(name: 'Milk (1 liter)', weight: 1000, in_stock: true, price: 0.45, expiration_date: Date.today + 14.days)
Item.create(name: 'Butter (250 g)', weight: 250, in_stock: true, price: 0.75, expiration_date: Date.today + 14.days)
Item.create(name: 'Flour (1 kg)', weight: 1000, in_stock: false, price: 0.45, expiration_date: Date.today + 100.days)
Item.create(name: 'Jelly Babies (6 x 300 g)', weight: 1500, in_stock: true, price: 4.96, expiration_date: Date.today + 1.year)
Item.create(name: 'Super-Duper Cake Mix', in_stock: true, price: 11.12, expiration_date: Date.today + 1.year)
Item.create(name: 'Eggs (12)', in_stock: true, price: 2, expiration_date: Date.today + 7.days)
Item.create(name: 'Peanuts (8 x 200 g bag)', in_stock: false, weight: 1600, price: 17.49, expiration_date: Date.today + 1.year)